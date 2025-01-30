//
//  ContentView.swift
//  FriendFace
//
//  Created by Akash Sheelavant on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    
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
        print("inside fetchData")
        if let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    users = try decoder.decode([User].self, from: data)
                } catch {
                    users = []
                }
            }.resume()
        }
    }
}

#Preview {
    ContentView()
}
