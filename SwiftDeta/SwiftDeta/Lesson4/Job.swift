//
//  Job.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: Student?
    
    init(name: String, priority: Int, owner: Student? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
