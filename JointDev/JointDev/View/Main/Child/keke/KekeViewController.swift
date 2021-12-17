//
//  KekeViewController.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit
import AVFoundation

class KekeViewController: UIViewController {
    let alarm = Alarm()
    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIDatePickerを.timeモードにする
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        //現在の時間をDatePickerに表示
        sleepTimePicker.setDate(Date(), animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
             //AlarmでsleepTimerがnilじゃない場合
            if alarm.sleepTimer != nil{
                //再生されているタイマーを止める
                alarm.stopTimer()
            }
        }
    
    @IBAction func setButton(_ sender: UIButton) {
        //AlarmにあるselectedWakeUpTimeにユーザーの入力した日付を代入
            alarm.selectedWakeUpTime = sleepTimePicker.date
            //AlarmのrunTimerを呼ぶ
            alarm.runTimer()
            //StopViewControllerへの画面移動
            performSegue(withIdentifier: "setToSleeping", sender: nil)
    }
    
}



extension KekeViewController {
    static func instantiate() -> Self {
        let vc: KekeViewController = .loadFromStoryboard()
        return vc as! Self
        
    }
}
