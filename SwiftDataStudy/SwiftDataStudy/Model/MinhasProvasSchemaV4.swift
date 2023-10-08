//
//  MinhasProvasSchemaV4.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

enum MinhasProvasSchemaV4: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 1, 0)
}

extension MinhasProvasSchemaV4 {
    @Model
    class Prova {
        @Attribute(.unique, originalName: "conteudo") var titulo: String
        var materia: String
        var data: Date
        var isImportante: Bool?
        
        init(titulo: String, materia: String, data: Date, isImportante: Bool) {
            self.titulo = titulo
            self.materia = materia
            self.data = data
            self.isImportante = isImportante
        }
    }
}
