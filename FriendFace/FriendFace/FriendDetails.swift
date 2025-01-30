//
//  FriendDetails.swift
//  FriendFace
//
//  Created by Akash Sheelavant on 1/29/25.
//

import SwiftUI

struct FriendDetails: View {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    var body: some View {
        Form {
            Section("Personal Details") {
                VStack(alignment: .leading) {
                    Text("Name: " + user.name)
                    Text("Age: " + String(describing: user.age))
                    Text("Company: " + user.company)
                    
                    
                    if let date = formattedDate() {
                        Text("Registered: " + date.description)
                    }
                }
            }
            Section("Friends") {
                List {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
    }
    
    
    private func formattedDate() -> String? {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .long
        
        return formatter.string(from: user.registered)
    }
}


#Preview {
    let friend = Friend(id: "", name: "Friend")
    let user = User(id: "",
                    isActive: true,
                    name: "Name",
                    age: 47,
                    company: "Company",
                    email: "email",
                    address: "address",
                    about: "about",
                    registered: Date(),
                    friends: [friend])
    FriendDetails(user: user)
}
