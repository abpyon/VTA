//
//  MainModel.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import Foundation

enum CellType: Hashable {
    case ueda(star: Bool)
    case ryouma
    case masaki
    case kame
    case katoshin
    case keke
    case kei
    
    var title: String {
        switch self {
        case .ueda:
            return "Ueda"
        case .ryouma:
            return "ryouma"
        case .masaki:
            return "masaki"
        case .kame:
            return "kame"
        case .katoshin:
            return "katoshin"
        case .keke:
            return "keke"
        case .kei:
            return "kei"
        }
    }
}
