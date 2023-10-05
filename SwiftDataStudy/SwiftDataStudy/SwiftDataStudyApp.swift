//
//  SwiftDataStudyApp.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 02/10/23.
//

import SwiftUI
import SwiftData

typealias Item = ItemV3.Item

@main
struct SwiftDataStudyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, migrationPlan: ItemPlan.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
