//
//  MinhasProvasSchemaV4.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

// Versão 4 das nossas models
enum MinhasProvasSchemaV4: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    // Seguindo o Versionamento Semântico, a segunda versão é a 1.1.0,
    // pois fizemos mudanças que adicionam uma nova feature.
    // leia sobre Versionamento Semântico aqui: https://semver.org/lang/pt-BR/
    static var versionIdentifier = Schema.Version(1, 1, 0)
}

extension MinhasProvasSchemaV4 {
    @Model
    class Prova {
        @Attribute(.unique, originalName: "conteudo") var titulo: String
        var materia: String
        var data: Date
        // Adicionamos o atributo "isImportante", e DEVEMOS colocar todo e qualquer atributo
        // novo de uma versão para outra como OPCIONAL, pois o SwiftData irá atribuir
        // os novos atributos como NULO (nil) no momento da migration, e se ela não for
        // opcional, o aplicativo irá quebrar.
        var isImportante: Bool?
        
        init(titulo: String, materia: String, data: Date, isImportante: Bool) {
            self.titulo = titulo
            self.materia = materia
            self.data = data
            self.isImportante = isImportante
        }
    }
}
