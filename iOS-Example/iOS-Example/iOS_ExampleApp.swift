//
//  iOS_ExampleApp.swift
//  iOS-Example
//
//  Created by Hangyeol on 2022/07/25.
//

import SwiftUI

@main
struct iOS_ExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
