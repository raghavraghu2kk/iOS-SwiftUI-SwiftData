//
//  Lesson3-DynamicallySortingFiltering.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

struct Lesson3_DynamicallySortingFiltering: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [SortDescriptor(\Person.name),SortDescriptor(\Person.joinDate)]
    
    var body: some View {
        NavigationStack{
            PeopleView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("People")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: Person.self)
                    
                    let first = Person(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -5))
                    let second = Person(name: "Rosa diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -10))
                    let third = Person(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    let fourth = Person(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Person.name),
                                SortDescriptor(\Person.joinDate)
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\Person.joinDate),
                                SortDescriptor(\Person.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    Lesson3_DynamicallySortingFiltering()
}
