//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Akash Sheelavant on 1/28/25.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
