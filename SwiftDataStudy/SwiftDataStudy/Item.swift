//
//  Item.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 02/10/23.
//

import Foundation
import SwiftData

enum ItemV1 : VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [Item.self]
    }
    
    @Model
    final class Item{
        var timestamp: Date
        var nome: String
        
        init(timestamp: Date) {
            self.timestamp = timestamp
            self.nome = ""
        }
    }
}

enum ItemV2 : VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 1)
    
    static var models: [any PersistentModel.Type] {
        [Item.self]
    }
    
    @Model
    final class Item{
        var timestamp: Date
        @Attribute(originalName: "nome") var seila: String
        
        init(timestamp: Date) {
            self.timestamp = timestamp
            self.seila = ""
        }
    }
}

enum ItemV3 : VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 2)
    
    static var models: [any PersistentModel.Type] {
        [Item.self]
    }
    
    @Model
    final class Item{
        var timestamp: Date
        @Attribute(originalName: "nome") var seila: String
        var gayNumber: Bool
        
        init(timestamp: Date, gayNumber: Bool) {
            self.timestamp = timestamp
            self.seila = ""
            self.gayNumber = gayNumber
        }
    }
}

enum ItemPlan : SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [
            ItemV1.self,
            ItemV2.self,
            ItemV3.self
        ]
    }
    
    static var stages: [MigrationStage] {
        [
            migrateV1toV2,
            migrateV2toV3
        ]
    }
    
    static let migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: ItemV1.self,
        toVersion: ItemV2.self
    )
    
    static let migrateV2toV3 = MigrationStage.lightweight(
        fromVersion: ItemV2.self,
        toVersion: ItemV3.self
        )
}
