//
//  MinhasProvasView.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftUI
import SwiftData

// A tela que mostra a lista de provas
struct MinhasProvasView : View {
    @Environment(\.modelContext) private var modelContext
    @Query var provas: [Prova]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(provas) { prova in
                        Button {
                            prova.isImportante?.toggle()
                        } label: {
                            ProvaComponent(prova: prova)
                        }

                    }
                    .onDelete(perform: deletarProva)
                }
                .foregroundStyle(.primary)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Minhas Provas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NovaProvaView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func deletarProva(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(provas[index])
            }
        }
    }
}


#Preview {
    MinhasProvasView()
        .modelContainer(for: [Prova.self], inMemory: true)
}
