//
//  MinhasProvasSchemaV2.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

// Versão 2 das nossas models
enum MinhasProvasSchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    // Seguindo o Versionamento Semântico, a segunda versão é a 1.0.1,
    // pois fizemos mudanças que não adicionam nenhuma feature.
    // leia sobre Versionamento Semântico aqui: https://semver.org/lang/pt-BR/
    static var versionIdentifier = Schema.Version(1, 0, 1)
}

extension MinhasProvasSchemaV2 {
    @Model
    class Prova {
        // da V1 para V2, trocamos o nome do atributo, de "conteudo" para "titulo".
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
