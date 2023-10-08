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
    final class Item {
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
        @Attribute(.unique) var nome: String
        
        init(timestamp: Date) {
            self.timestamp = timestamp
            self.nome = ""
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
        @Attribute(.unique) var nome: String
        var number: Int?
        
        init(timestamp: Date, number: Int) {
            self.timestamp = timestamp
            self.nome = ""
            self.number = number
        }
    }
}

enum ItemV4 : VersionedSchema {
    static var versionIdentifier = Schema.Version(1,1,0)
    
    static var models: [any PersistentModel.Type] {
        [Item.self]
    }
    
    @Model
    final class Item{
        var timestamp: Date
        @Attribute(.unique) var nome: String
        var number: Int
        var text: String?
        
        init(timestamp: Date, number: Int, text: String) {
            self.timestamp = timestamp
            self.nome = ""
            self.number = number
            self.text = text
        }
    }
}

enum ItemPlan : SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [
            ItemV1.self,
            ItemV2.self,
            ItemV3.self,
            ItemV4.self
        ]
    }
    
    static var stages: [MigrationStage] {
        [
            migrateV1toV2,
            migrateV2toV3,
            migrateV3toV4
        ]
    }
    
    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: ItemV1.self,
        toVersion: ItemV2.self,
        willMigrate: { context in
            let items = try context.fetch(FetchDescriptor<ItemV1.Item>())
            var usedNames = Set<String>()
            
            for item in items {
                if usedNames.contains(item.nome) {
                    context.delete(item)
                }
                
                usedNames.insert(item.nome)
            }
            
            try context.save()
        },
        didMigrate: nil
    )
    
    static let migrateV2toV3 = MigrationStage.custom(
        fromVersion: ItemV2.self,
        toVersion: ItemV3.self,
        willMigrate: nil) { context in
            let items = try context.fetch(FetchDescriptor<ItemV3.Item>())
            
            items.forEach { item in
                item.number = 69
            }
            
            try context.save()
        }
    
    static let migrateV3toV4 = MigrationStage.custom(
        fromVersion: ItemV3.self,
        toVersion: ItemV4.self,
        willMigrate: nil) { context in
            let items = try context.fetch(FetchDescriptor<ItemV4.Item>())
            
            items.forEach { item in
                item.text = "migrated text"
            }
            
            try context.save()
        }
}
