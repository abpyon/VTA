//
//  Alarm.swift
//  JointDev
//
//  Created by MacUser on 2021/12/10.
//

import UIKit
import AVFoundation

class Alarm{
    var selectedWakeUpTime:Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0

    //アラーム/タイマーを開始
    func runTimer(){
        //calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)

        if sleepTimer == nil{
             //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    //一秒ごとにsleepTimerに呼ばれる
    @objc private func updateTimer(){
        if seconds != 0{
            seconds -= 1
            
            print(seconds)
        }else{
            sleepTimer?.invalidate()
            sleepTimer = nil
            let soundFilePath = Bundle.main.path(forResource: "Gunshot01-1", ofType: "mp3")!
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
                //Swift4
                //try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
                //Swift 4.2
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Cannot load file")
            }
            audioPlayer.play()
            print(audioPlayer.isPlaying)
        }
    }
    
    func stopTimer(){
        if sleepTimer != nil {
            sleepTimer!.invalidate()
            sleepTimer = nil
        }
    }

    //起きる時間までの秒数を計算
    private func calculateInterval(userAwakeTime:Date)-> Int{
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
