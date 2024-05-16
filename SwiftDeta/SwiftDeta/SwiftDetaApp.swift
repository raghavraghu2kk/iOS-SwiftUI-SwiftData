//
//  SwiftDetaApp.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDetaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self,User1.self,Person.self,Student.self])
    }
}
