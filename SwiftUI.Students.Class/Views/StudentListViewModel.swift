//
//  StudentListViewModel.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import SwiftUI
import Combine


class StudentListViewModel: ObservableObject {
    
    @Published var groups: [Group] = [
        Group(
            title: "IOS Developers", students: [
                Student(name: "Vadim P.", imageName: "airplane", score: 1.0),
                Student(name: "Andre G.", imageName: "bus.doubledecker.fill", score: 2.0),
                Student(name: "Gamlet", imageName: "tram.circle", score: 1.4),
                Student(name: "Pavel K.", imageName: "car.ferry.fill", score: 6.0),
                Student(name: "Valera", imageName: "bicycle", score: 5.7),
                Student(name: "Andrey M.", imageName: "figure.walk", score: 3.7),
                Student(name: "Vova H.", imageName: "fuelpump", score: 1.3),
                Student(name: "Roman Sh.", imageName: "scooter", score: 8.9),
            ]
        )
    ]
    
    func addRandomGroup() {
        groups.append(RandomGroupFabric().makeRandomGroup())
    }
    
}
