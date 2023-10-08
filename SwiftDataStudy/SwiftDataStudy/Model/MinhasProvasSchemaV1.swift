//
//  MinhasProvasSchemaV1.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

// Versão 1 das nossas models
enum MinhasProvasSchemaV1: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    // Seguindo o Versionamento Semântico, a primeira versão é a 1.0.0
    // leia sobre Versionamento Semântico aqui: https://semver.org/lang/pt-BR/
    static var versionIdentifier = Schema.Version(1, 0, 0)
}

extension MinhasProvasSchemaV1 {
    // primeira model
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
