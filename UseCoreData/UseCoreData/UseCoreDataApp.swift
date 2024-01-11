//
//  UseCoreDataApp.swift
//  UseCoreData
//
//  Created by Bach Pham on 17/10/2023.
//

import SwiftUI

@main
struct UseCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
