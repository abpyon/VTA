//
//  StopAlarmViewController.swift
//  JointDev
//
//  Created by MacUser on 2021/12/10.
//

import UIKit

class StopAlarmViewController: UIViewController{
    
    var currentTime = CurrentTime()
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateTime(_ time:String) {
        timeLabel.text = time
    }
}
