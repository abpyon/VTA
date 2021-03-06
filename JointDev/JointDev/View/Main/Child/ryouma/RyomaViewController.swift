//
//  RyomaViewController.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit



final class RyomaViewController: UIViewController,
                                 UITableViewDelegate,
                                 UITableViewDataSource{
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var foods = ["apple","orenge","remon","grape"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let profileImage = cell.viewWithTag(1) as! UIImageView
        let userName = cell.viewWithTag(2) as! UILabel
        let userID = cell.viewWithTag(3) as! UILabel
        let comment = cell.viewWithTag(4) as! UILabel
        
        userName.text = foods[indexPath.row]
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
}

extension RyomaViewController {
    static func instantiate() -> Self {
        let vc: RyomaViewController = .loadFromStoryboard()
        return vc as! Self
    }
}
