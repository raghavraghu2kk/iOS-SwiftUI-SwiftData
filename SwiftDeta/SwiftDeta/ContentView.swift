//
//  ContentView.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Lesson1_Editing_SwiftData_model().tabItem { Label("Edit Data", systemImage: "square.and.pencil") }
            Lesson2_FilterSwiftData().tabItem { Label("Filter Data", systemImage: "slider.horizontal.3") }
            Lesson3_DynamicallySortingFiltering().tabItem { Label("Dynamic Filter", systemImage: "rectangle.and.pencil.and.ellipsis.rtl") }
            Lesson4_RelationshipsWithSwiftDataSwiftUIQuery().tabItem { Label("Relationship Data", systemImage: "swiftdata") }
            Lesson5SyncingSwiftDataWithCloudKit()
        }
        .navigationTitle("Swift Data")
    }
}

#Preview {
    ContentView()
}

