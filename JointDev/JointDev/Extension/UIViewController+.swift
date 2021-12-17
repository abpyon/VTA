//
//  UIViewController+.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import UIKit

extension UIViewController {
  static func loadFromStoryboard<T: UIViewController>() -> T {
    let vc: T = UIStoryboard(name: T.className, bundle: nil).instantiateInitialViewController() as! T
    return vc
  }
}
