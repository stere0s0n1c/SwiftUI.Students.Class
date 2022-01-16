//
//  StudentList.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import SwiftUI


struct StudentList: View {
    
    @StateObject var viewModel = StudentListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.groups) { section in
                    Section(header: Text(section.title), footer: Text("\(section.students.count) students")) {
                        ForEach(section.students) { student in
                            NavigationLink {
                                StudentView(student: student)
                            } label: {
                                StudentRow(student: student)
                            }
                        }
                    }
                }
                Button {
                    viewModel.addRandomGroup()
                    
                } label: {
                    HStack {
                        Image(systemName: "person.badge.plus")
                        Text("Add random group")
                    }.foregroundColor(.orange)
                }
            }
            .navigationTitle("Students")
            .toolbar {
                Button {
                    viewModel.addRandomGroup()
                } label: {
                    Image(systemName: "person.badge.plus")
                        .resizable()
                        .foregroundColor(.mint)
                        .frame(width: 30, height: 30)
                }
            }
            
            
        }
        
    }
    
}

struct StudentList_Previews: PreviewProvider {
    static var previews: some View {
        StudentList()
            .previewInterfaceOrientation(.portrait)
    }
}
