//
//  iOS_ExampleApp.swift
//  iOS-Example
//
//  Created by Hangyeol on 2022/07/25.
//

import SwiftUI
import GLUtils

@main
struct iOS_ExampleApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        if UIDevice.current.systemVersion.hasPrefix("14") {
            NSString.swizzleReplacingCharacters()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
