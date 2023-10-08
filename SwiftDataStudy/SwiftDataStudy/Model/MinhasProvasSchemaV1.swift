//
//  MinhasProvasSchemaV1.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

enum MinhasProvasSchemaV1: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 0, 0)
}

extension MinhasProvasSchemaV1 {
    @Model
    class Prova {
        var conteudo: String
        var materia: String
        var data: Date
        
        init(conteudo: String, materia: String, data: Date) {
            self.conteudo = conteudo
            self.materia = materia
            self.data = data
        }
    }
}
