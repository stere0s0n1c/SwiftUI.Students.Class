//
//  StudentRow.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import SwiftUI

struct StudentRow: View {

    let student: Student

    var body: some View {
        HStack {
            Image(systemName: student.imageName).foregroundColor(.cyan)
            Text(student.name)
                .font(.headline)
            Spacer()
        }
    }
    
}

struct StudentRow_Previews: PreviewProvider {
    static var previews: some View {
        StudentRow(student: RandomStudentFabric().makeRandomStudent())
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
