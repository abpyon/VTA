//
//  NSObject+.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import Foundation

public extension NSObject {
  static var className: String {
    String(describing: self)
  }
  var className: String {
    type(of: self).className
  }
}
