//
//  User.swift
//  FriendFace
//
//  Created by Akash Sheelavant on 1/28/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let friends: [Friend]
}
