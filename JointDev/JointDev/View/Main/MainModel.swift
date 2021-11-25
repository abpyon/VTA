//
//  MainModel.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import Foundation

enum CellType: Hashable {
    case ueda(star: Bool)
    case hiroto
    
    var title: String {
        switch self {
        case .ueda:
            return "Ueda"
        case .hiroto:
            return "Hiroto"
        }
    }
}
