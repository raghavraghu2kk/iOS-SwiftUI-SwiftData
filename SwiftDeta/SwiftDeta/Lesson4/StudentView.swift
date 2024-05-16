//
//  StudentView.swift
//  SwiftDeta
//
//  Created by Raghavendra Mirajkar on 16/05/24.
//

import SwiftUI
import SwiftData

struct StudentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students : [Student]
    
    var body: some View {
        List(students) { student in
            HStack{
                Text(student.name)
                Spacer()
                Text(String(student.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.circle)
            }
        }
        .onAppear(perform: {
            addSample()
        })
    }
    
    init(minimumJoinDate: Date,sortOrder: [SortDescriptor<Student>]) {
        _students = Query(filter: #Predicate<Student> { student in
            student.joinDate >= minimumJoinDate
        },sort: sortOrder)
    }
    
    func addSample() {
        let student1 = Student(name: "Rakshitha", city: "Blore", joinDate: .now)
        let job1 = Job(name: "Software Engineer", priority: 3)
        let job2 = Job(name: "Developer", priority: 4)
        
        modelContext.insert(student1)
        
        student1.jobs.append(job1)
        student1.jobs.append(job2)
    }
}

#Preview {
    StudentView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\Student.name)])
        .modelContainer(for: Student.self)
}
