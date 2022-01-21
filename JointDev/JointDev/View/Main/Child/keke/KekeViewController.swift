//
//  KekeViewController.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit
import AVFoundation

class KekeViewController: UIViewController {
    
    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    var selectedWakeUpTime: Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIDatePickerを.timeモードにする
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        //現在の時間をDatePickerに表示
        sleepTimePicker.setDate(Date(), animated: false)
        
        let soundFilePath = Bundle.main.path(forResource: "Gunshot01-1", ofType: "mp3")!
        let sound: URL = URL(fileURLWithPath: soundFilePath)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
            //音楽をバッファに読み込んでおく
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // AlarmでsleepTimerがnilじゃない場合
        if sleepTimer != nil{
            // 再生されているタイマーを止める
            if sleepTimer != nil {
                sleepTimer!.invalidate()
                sleepTimer = nil
            }
        }
    }
    
    @IBAction func setButton(_ sender: UIButton) {
        // AlarmにあるselectedWakeUpTimeにユーザーの入力した日付を代入
        selectedWakeUpTime = sleepTimePicker.date
        // AlarmのrunTimerを呼ぶ
        runTimer()
        // StopAlarmViewControllerへの画面移動
        performSegue(withIdentifier: "ToSet", sender: nil)
    }
    
}

// MARK: Constractor

extension KekeViewController {
    static func instantiate() -> Self {
        let vc: KekeViewController = .loadFromStoryboard()
        return vc as! Self
    }
}

// MARK: Alerm

extension KekeViewController {
    /// アラーム/タイマーを開始
    func runTimer() {
        // calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)

        if sleepTimer == nil {
             //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    //一秒ごとにsleepTimerに呼ばれる
    @objc private func updateTimer() {
        if seconds != 0 {
            seconds -= 1
            
            
//            timerLabel.text = String(format: "%.1f", seconds)
            
            print(seconds)
        } else {
            sleepTimer?.invalidate()
            sleepTimer = nil
            
            // 端末にsilent通知を行う
            setAlarm()
            
            audioPlayer.play()
            // これ以降の処理は実行されない
        }
    }
    
    private func setAlarm() {
        
        let content = UNMutableNotificationContent()
        content.title = "Timer is ringing"
        content.body = "設定した時間になりました"
        content.sound = UNNotificationSound.default
        
        var dateComponentsDay = DateComponents()
        // タイマーが0になった時間
        dateComponentsDay.hour = 1
        // タイマーが0になった分
        dateComponentsDay.minute = 30
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsDay, repeats: false)
        
        let request = UNNotificationRequest(identifier:"wd", content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
           if error != nil {
               print(error.debugDescription)
           }
        }
    }

    /// 起きる時間までの秒数を計算
    private func calculateInterval(userAwakeTime:Date) -> Int {
        //タイマーの時間を計算する
        var interval = Int(userAwakeTime.timeIntervalSinceNow)

        if interval < 0{
            //落とし穴 ②の解決策
            interval = 86400 - (0 - interval)
        }
        //落とし穴 ③の解決策
        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
}
