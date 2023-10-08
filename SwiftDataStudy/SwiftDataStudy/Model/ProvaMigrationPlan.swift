//
//  ProvaMigrationPlan.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

enum ProvaMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [
            MinhasProvasSchemaV1.self,
            MinhasProvasSchemaV2.self,
            MinhasProvasSchemaV3.self,
            MinhasProvasSchemaV4.self
        ]
    }
    
    static var stages: [MigrationStage] {
        [
            migrateV1toV2,
            migrateV2toV3,
            migrateV3toV4
        ]
    }
}

extension ProvaMigrationPlan {
    static var migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: MinhasProvasSchemaV1.self,
        toVersion: MinhasProvasSchemaV2.self
    )
    
    static var migrateV2toV3 = MigrationStage.custom(
        fromVersion: MinhasProvasSchemaV2.self,
        toVersion: MinhasProvasSchemaV3.self,
        willMigrate: { context in
            let provas = try context.fetch(FetchDescriptor<MinhasProvasSchemaV2.Prova>())
            
            var titulos = Set<String>()
            
            provas.forEach { prova in
                if titulos.contains(prova.titulo) {
                    context.delete(prova)
                }
                
                titulos.insert(prova.titulo)
            }
            
            try context.save()
        },
        didMigrate: nil
    )
    
    static var migrateV3toV4 = MigrationStage.custom(
        fromVersion: MinhasProvasSchemaV3.self,
        toVersion: MinhasProvasSchemaV4.self,
        willMigrate: nil) { context in
            let provas = try context.fetch(FetchDescriptor<MinhasProvasSchemaV4.Prova>())
            
            provas.forEach { prova in
                prova.isImportante = true
            }
            
            try context.save()
        }
}
