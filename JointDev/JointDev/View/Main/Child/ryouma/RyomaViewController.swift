//
//  RyomaViewController.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit



final class RyomaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak private var tableView: UITableView!
    
    private var foods = ["apple","orenge","remon","grape"]
    private var comments = ["appleaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","orengerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr","remonrrrrrrrrrrrrrrrrrrrr","graperrrrrrrrrrrrrrrrrrrrrr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RyomaTableViewCell", bundle: nil), forCellReuseIdentifier: "RyomaTableViewCell")

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RyomaTableViewCell", for: indexPath) as! RyomaTableViewCell
        cell.userName.text = foods[indexPath.row]
        cell.comment.text = comments[indexPath.row]
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
