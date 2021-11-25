//
//  MainViewModel.swift
//  JointDev
//
//  Created by Instructor on 2021/11/26.
//

import Foundation

final class MainViewModel {
    var sections: [CellType]?

    init() {
        sections = makeSections()
    }
}

// MARK: Private

extension MainViewModel {
    private func makeSections() -> [CellType] {
        let cells: [CellType] = [
            .ueda(star: true),
            .hiroto
        ]
        return cells
    }
}
