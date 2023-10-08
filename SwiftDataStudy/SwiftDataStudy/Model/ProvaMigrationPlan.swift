//
//  ProvaMigrationPlan.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

// SchemaMigrationPlan, ditando o rumo de cada migração de versão
enum ProvaMigrationPlan: SchemaMigrationPlan {
    // lista com todas as versões das models (VersionedSchemas)
    static var schemas: [any VersionedSchema.Type] {
        [
            MinhasProvasSchemaV1.self,
            MinhasProvasSchemaV2.self,
            MinhasProvasSchemaV3.self,
            MinhasProvasSchemaV4.self
        ]
    }
    
    // lista com todos os estágios de migração (MigrationStages)
    static var stages: [MigrationStage] {
        [
            migrateV1toV2,
            migrateV2toV3,
            migrateV3toV4
        ]
    }
}

// todos os estágios de migração (MigrationStages)
extension ProvaMigrationPlan {
    // Migração da versão 1 para a versão 2.
    // Como é uma mudança simples (nome de variável), pode-se usar
    // a migração do tipo .lightweight
    static var migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: MinhasProvasSchemaV1.self,
        toVersion: MinhasProvasSchemaV2.self
    )
    
    // Migração da versão 2 para a versão 3.
    // Como é uma mudança que pode ocasionar problemas (atributo único)
    // a migração é do tipo .custom
    static var migrateV2toV3 = MigrationStage.custom(
        fromVersion: MinhasProvasSchemaV2.self,
        toVersion: MinhasProvasSchemaV3.self,
        willMigrate: { context in
            // como agora temos um atributo único, é necessário verificar se
            // na versão anterior não existe nenhuma model que contenha o atributo
            // único repetido, caso houver, nós deletamos do nosso container a repetição.
            let provas = try context.fetch(FetchDescriptor<MinhasProvasSchemaV2.Prova>())
            
            var titulos = Set<String>()
            
            // nessa lógica, percorremos toda a lista das models presentes no container,
            // verificamos se o atributo único não está presente no Set de strings, caso não,
            // não fazemos nada e adicionamos o atributo único no Set. Caso houver o título
            // já no Set, nós deletamos essa model do container.
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
    
    // Migração da versão 3 para a versão 4.
    // Como é uma mudança que pode ocasionar problemas (novo atributo)
    // a migração é do tipo .custom
    static var migrateV3toV4 = MigrationStage.custom(
        fromVersion: MinhasProvasSchemaV3.self,
        toVersion: MinhasProvasSchemaV4.self,
        willMigrate: nil) { context in
            // pegamos todas as models presente no container após a migração, para assim,
            // atribuirmos um valor para o novo parâmetro.
            let provas = try context.fetch(FetchDescriptor<MinhasProvasSchemaV4.Prova>())
            
            provas.forEach { prova in
                prova.isImportante = true
            }
            
            try context.save()
        }
}
