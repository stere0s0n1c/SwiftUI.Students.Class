//
//  SwiftUI_Students_ClassApp.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import SwiftUI

@main
struct SwiftUI_Students_ClassApp: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            StudentList()
        }
        .onChange(of: scenePhase) { scenePhase in
            switch scenePhase {
            case .active:
                break
            case .inactive:
                break
            case .background:
                break
            @unknown default:
                break
            }
        }
    }

}
