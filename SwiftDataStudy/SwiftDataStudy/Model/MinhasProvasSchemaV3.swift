//
//  MinhasProvasSchemaV3.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

enum MinhasProvasSchemaV3: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 0, 2)
}

extension MinhasProvasSchemaV3 {
    @Model
    class Prova {
        @Attribute(.unique, originalName: "conteudo") var titulo: String
        var materia: String
        var data: Date
        
        init(titulo: String, materia: String, data: Date) {
            self.titulo = titulo
            self.materia = materia
            self.data = data
        }
    }
}
