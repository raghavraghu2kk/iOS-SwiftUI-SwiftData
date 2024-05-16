//
//  Lesson4-RelationshipsWithSwiftDataSwiftUIQuery.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

struct Lesson4_RelationshipsWithSwiftDataSwiftUIQuery: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [SortDescriptor(\Student.name),SortDescriptor(\Student.joinDate)]

    
    var body: some View {
        NavigationStack {
            StudentView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .navigationTitle("Students")
                .toolbar {
                    Button("Add Samples", systemImage: "plus") {
                        try? modelContext.delete(model: Student.self)
                        
                        let first = Student(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -5))
                        let second = Student(name: "Rosa diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -10))
                        let third = Student(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                        let fourth = Student(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
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
                                    SortDescriptor(\Student.name),
                                    SortDescriptor(\Student.joinDate)
                                ])
                            
                            Text("Sort by Join Date")
                                .tag([
                                    SortDescriptor(\Student.joinDate),
                                    SortDescriptor(\Student.name)
                                ])
                        }
                    }
                }
        }
    }
}

#Preview {
    Lesson4_RelationshipsWithSwiftDataSwiftUIQuery()
}
