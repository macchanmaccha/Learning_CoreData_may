//
//  LearningCoreDataApp.swift
//  LearningCoreData
//
//  Created by apple on 2023/04/26.
//

import SwiftUI

@main
struct LearningCoreDataApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
