//
//  ArrayExtensions.swift
//  GreenShop
//
//  Created by Роман on 29.07.2023.
//

import Foundation

extension Array {
    func split(_ side: Bool) -> [Element] {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        if side {
            return Array(rightSplit)
        } else {
            return Array(leftSplit)
        }
    }
}
