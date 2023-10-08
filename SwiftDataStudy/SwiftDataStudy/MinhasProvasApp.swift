//
//  MinhasProvasApp.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftUI
import SwiftData

typealias Prova = MinhasProvasSchemaV4.Prova

@main
struct SwiftDataStudyApp: App {
    let container: ModelContainer
    
    init() {
        do {
            self.container = try ModelContainer(
                for: Prova.self,
                migrationPlan: ProvaMigrationPlan.self,
                configurations: ModelConfiguration(for: Prova.self)
            )
        } catch {
            fatalError("Could not initialize the container")
        }
    }

    var body: some Scene {
        WindowGroup {
            MinhasProvasView()
        }
        .modelContainer(container)
    }
}
