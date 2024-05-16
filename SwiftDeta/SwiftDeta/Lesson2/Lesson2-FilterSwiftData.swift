//
//  Lesson2-FilterSwiftData.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

struct Lesson2_FilterSwiftData: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User1> { user in
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            } else { return false }
        } else { return false }
    },sort: \User1.name) var users1 : [User1]
    
    var body: some View {
        NavigationStack{
            List(users1) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User1.self)
                    
                    let first = User1(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -5))
                    let second = User1(name: "Rosa diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -10))
                    let third = User1(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    let fourth = User1(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    Lesson2_FilterSwiftData()
}
