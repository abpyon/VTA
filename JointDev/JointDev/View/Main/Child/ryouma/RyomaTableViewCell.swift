//
//  RyomaTableViewCell.swift
//  JointDev
//
//  Created by N. Ryoma on 2021/12/10.
//

import UIKit

class RyomaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var goodNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 25
        profileImage.image = UIImage(named: "person")
        goodImage.image = UIImage(named: "goodButton")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
