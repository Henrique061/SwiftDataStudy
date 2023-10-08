//
//  MinhasProvasSchemaV2.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

enum MinhasProvasSchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 0, 1)
}

extension MinhasProvasSchemaV2 {
    @Model
    class Prova {
        @Attribute(originalName: "conteudo") var titulo: String
        var materia: String
        var data: Date
        
        init(titulo: String, materia: String, data: Date) {
            self.titulo = titulo
            self.materia = materia
            self.data = data
        }
    }
}
