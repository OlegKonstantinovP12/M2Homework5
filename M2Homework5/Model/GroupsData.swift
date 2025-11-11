//
//  GroupData.swift
//  M2Homework5
//
//  Created by Oleg Konstantinov on 11.11.2025.
//

import Foundation

struct GroupsData {
    let group: String
    let image: String
    let description: String
    
    static func mockLoadData() -> [GroupsData] {
        [
            GroupsData(group: "Group 1", image: "hands.sparkles", description: "Some Text"),
            GroupsData(group: "Group 2", image: "doc.text.image", description: "Some Text"),
            GroupsData(group: "Group 3", image: "wrench.fill", description: "Some Text"),
            GroupsData(group: "Group 4", image: "mic.circle", description: "Some Text"),

        ]
    }
}
