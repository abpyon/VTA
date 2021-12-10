//
//  KekeViewController.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit

class KekeViewController: UIViewController {
//    let alarm = Alarm()
    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIDatePickerを.timeモードにする
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        //現在の時間をDatePickerに表示
        sleepTimePicker.setDate(Date(), animated: false)
    }
    
}

func setButton(_ sender: UIButton) {
}

extension KekeViewController {
    static func instantiate() -> Self {
        let vc: KekeViewController = .loadFromStoryboard()
        return vc as! Self
    }
}
