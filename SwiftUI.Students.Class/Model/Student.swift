//
//  Student.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import Foundation

struct Student: Identifiable {
    
    let id = UUID()
    let name: String
    let imageName: String
    let score: Float
    
}

struct Group: Identifiable {
    let id = UUID()
    let title: String
    var students: [Student]
}

protocol StudentCreator {
    func makeRandomStudent() -> Student
}

protocol GroupCreator {
    func makeRandomGroup() -> Group
}

class RandomStudentFabric: StudentCreator {
    
    private let names = [
        "Vasya", "Petya", "Andrew", "Lola", "Lu", "Sergej", "John", "Andjei", "Adam"
    ]
    
    private let imagesList = [
        "umbrella", "car", "pencil", "umbrella.fill", "rectangle.inset.filled.and.person.filled", "person.circle", "gamecontroller", "bolt.fill"
    ]
    
    private let surnames = [
        "Smith", "Johns", "Sin Bo", "Petrovich", "Jukovichz", "Valevko", "Gusinashvili", "Chaves"
    ]
    
    func makeRandomStudent() -> Student {
        Student(
            name: names[Int.random(in: 0...names.count - 1)] + " " + surnames[Int.random(in: 0...surnames.count - 1)],
            imageName: imagesList[Int.random(in: 0...imagesList.count - 1)],
            score: Float.random(in: 2...10)
        )
    }
}

class RandomGroupFabric: GroupCreator {
    
    private let groupNames = [
        "Airlines", "CuberTracks", "NASA", "Global Village", "Worker's Editionals", "Right Communists", "Adventure Beyongers"
    ]
    
    func makeRandomGroup() -> Group {
        
        var students: [Student] = []
        for _ in 0...Int.random(in: 2...7) {
            students.append(RandomStudentFabric().makeRandomStudent())
        }
        return Group(title: groupNames[Int.random(in: 0...groupNames.count - 1)], students: students)
    }
    
}
