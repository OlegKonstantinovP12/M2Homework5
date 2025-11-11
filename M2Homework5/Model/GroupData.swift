//
//  GroupData.swift
//  M2Homework5
//
//  Created by Oleg Konstantinov on 11.11.2025.
//

import Foundation

struct GroupData {
    let group: String
    let image: String
    let description: String
    
    static func mockLoadData() -> [GroupData] {
        [
            GroupData(group: "Group 1", image: "hands.sparkles", description: "Some Text"),
            GroupData(group: "Group 2", image: "doc.text.image", description: "Some Text"),
            GroupData(group: "Group 3", image: "wrench.fill", description: "Some Text"),
            GroupData(group: "Group 4", image: "mic.circle", description: "Some Text"),

        ]
    }
}
