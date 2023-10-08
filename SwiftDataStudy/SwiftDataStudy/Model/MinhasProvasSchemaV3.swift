//
//  MinhasProvasSchemaV3.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData

// Versão 3 das nossas models/
enum MinhasProvasSchemaV3: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Prova.self]
    }
    
    // Seguindo o Versionamento Semântico, a segunda versão é a 1.0.2,
    // pois fizemos mudanças que não adicionam nenhuma feature.
    // leia sobre Versionamento Semântico aqui: https://semver.org/lang/pt-BR/
    static var versionIdentifier = Schema.Version(1, 0, 2)
}

extension MinhasProvasSchemaV3 {
    @Model
    class Prova {
        // da V2 para V3, dissemos que o atributo "titulo" agora é único, ou seja,
        // não pode haver mais de uma model com o mesmo valor para "titulo".
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
