//
//  MinhasProvasApp.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftUI
import SwiftData

// Esse novo tipo (com o mesmo nome da model) é para facilitar o trabalho com o código, 
// ao invés de renomear as instâncias das models no aplicativo inteiro a cada versão
// nova, nós apenas alteramos a versão aqui nesse tipo novo
typealias Prova = MinhasProvasSchemaV4.Prova

@main
struct SwiftDataStudyApp: App {
    let container: ModelContainer
    
    init() {
        do {
            // Criação do container deve conter o parâmetro "migrationPlan", para
            // dizermos ao nosso container qual será o SchemaMigrationPlan dele.
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
