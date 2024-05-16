//
//  PeopleView.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData
struct PeopleView: View {
    @Query var people : [Person]
    
    var body: some View {
        List(people) { person in
            Text(person.name)
        }
    }
    
    init(minimumJoinDate: Date,sortOrder: [SortDescriptor<Person>]) {
        _people = Query(filter: #Predicate<Person> { person in
            person.joinDate >= minimumJoinDate
        },sort: sortOrder)
    }
}

#Preview {
    PeopleView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\Person.name)])
        .modelContainer(for: Person.self)
}
