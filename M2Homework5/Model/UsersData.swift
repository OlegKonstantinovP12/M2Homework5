//
//  Model.swift
//  M2Homework5
//
//  Created by Oleg Konstantinov on 11.11.2025.
//

import Foundation

struct UsersData {
    let name: String
    let icon: String
    
    static func mockLoadData() -> [UsersData] {
        [
            UsersData(name: "User 1", icon: "hands.sparkles"),
            UsersData(name: "User 2", icon: "doc.text.image"),
            UsersData(name: "User 3", icon: "wrench.fill"),
            UsersData(name: "User 4", icon: "mic.circle"),
            UsersData(name: "User 5", icon: "arrow.right.arrow.left"),
            UsersData(name: "User 6", icon: "person.fill"),
            UsersData(name: "User 7", icon: "person.circle"),
            UsersData(name: "User 8", icon: "book.circle.fill"),
        ]
    }
}
