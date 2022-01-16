//
//  StudentView.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import SwiftUI

struct StudentView: View {

    let student: Student

    var body: some View {
        VStack {

            Image(systemName: student.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)

            Text(student.name)
                .font(.largeTitle)
                .fontWeight(.heavy)

            HStack {
                Text("Score:")
                Text(String(format: "%0.1f", student.score))
            }
            .font(.caption)
            .foregroundColor(.secondary)
            
            Spacer()
        }
        .navigationTitle("Student")
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView(student: RandomStudentFabric().makeRandomStudent())
    }
}
