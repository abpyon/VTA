//
//  TempModel.swift
//  JointDev
//
//  Created by HirotoUeda on R 3/11/05.
//

import UIKit

// final class ~みたいにしても良いけど、いちいちアクセスが面倒になるのでこんな感じ

struct TempModel {
    struct UserImageModel {
        let imageName: Int
        let imageUrl: URL?
    }
    
    let id: String
    let name: String
    let image: [UserImageModel]
    let updatedAt: Date?
}

// enum（列挙体）性別とかに使う
enum TempType: String {
    case temp
}

// 初期値を入れておくこともできる（同じ初期値はNG）
enum TempType1: String {
    case gender = "gender"
    case man = "man"
    case woman = "woman"
}
