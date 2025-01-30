//
//  ContentView.swift
//  FriendFace
//
//  Created by Akash Sheelavant on 1/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        FriendDetails(user: user)
                        //Text(user.name)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text("isActive: \(user.isActive)")
                        }
                    }
                    
                }
            }
            
            .navigationTitle("Friends")
        }
        
        .onAppear {
            if users.isEmpty {
                fetchData()
            }
        }
    }
    
    
    func fetchData() {
        if let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let usersResponse = try decoder.decode([User].self, from: data)
                    for user in usersResponse {
                        modelContext.insert(user)
                    }
                    
                } catch {
                    return
                }
            }.resume()
        }
    }
}

#Preview {
    ContentView()
}
