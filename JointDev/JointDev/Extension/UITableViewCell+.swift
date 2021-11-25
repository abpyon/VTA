//
//  UITableViewCell+.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit

///　UITableViewCellの拡張。よく使うやつとかはまとめておくとコードスッキリ
extension UITableViewCell {
  class func registerTableView(tableView: UITableView, addingIdentifier: String = "") {
    let string: String = .init(describing: self)
    tableView.register(UINib(nibName: string, bundle: nil), forCellReuseIdentifier: string + addingIdentifier)
  }
  class func dequeue<T: UITableViewCell>(fromTableView: UITableView, indexPath: IndexPath, addingIdentifier: String = "") -> T {
    let string: String = .init(describing: self) + addingIdentifier
    return fromTableView.dequeueReusableCell(withIdentifier: string, for: indexPath) as! T
  }
  class func clearDivingLine<T: UITableViewCell>(fromCell: T) {
    let insetLeft = fromCell.separatorInset.left
    fromCell.separatorInset = UIEdgeInsets(top: 0, left: insetLeft, bottom: 0, right: .greatestFiniteMagnitude)
  }
}
