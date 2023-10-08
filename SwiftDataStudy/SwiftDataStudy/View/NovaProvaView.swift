//
//  NovaProvaView.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftData
import SwiftUI

// Tela de criação de uma nova prova
struct NovaProvaView : View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    // text fields
    @State var conteudo: String = String()
    @State var materia: String = String()
    @State var data: Date = Date()
    
    var body: some View {
        VStack {
            HStack {
                Text("Conteúdo:")
                TextField("Conteúdo", text: $conteudo)
            }
            
            HStack {
                Text("Matéria:")
                TextField("Conteúdo", text: $materia)
            }
            
            HStack {
                DatePicker("Data", selection: $data, displayedComponents: [.date])
            }
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    salvarProva()
                    dismiss()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        Spacer()
    }
    
    private func salvarProva() {
        withAnimation {
            let novaProva = Prova(titulo: conteudo, materia: materia, data: data, isImportante: false)
            modelContext.insert(novaProva)
        }
    }
}

#Preview {
    NovaProvaView()
}
