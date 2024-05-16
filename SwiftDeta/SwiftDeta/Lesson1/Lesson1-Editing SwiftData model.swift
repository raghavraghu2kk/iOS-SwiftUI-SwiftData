//
//  Lesson1-Editing SwiftData model.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

struct Lesson1_Editing_SwiftData_model: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
}

#Preview {
    Lesson1_Editing_SwiftData_model()
}
