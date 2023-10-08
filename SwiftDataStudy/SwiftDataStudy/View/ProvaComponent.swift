//
//  ProvaComponent.swift
//  SwiftDataStudy
//
//  Created by Henrique Assis on 07/10/23.
//

import Foundation
import SwiftUI

struct ProvaComponent : View {
    var prova: Prova
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 3)
                .foregroundStyle(.white)
            
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text(prova.titulo)
                            .font(.system(size: 35))
                            .bold()
                        
                        Text("Matéria: \(prova.materia)")
                        
                        Text("Data: \(prova.data, format: Date.FormatStyle(date: .numeric))")
                    }
                    .padding(.leading)
                }
                
                Spacer()
                
                Circle()
                    .frame(width: 40, height: 40)
                    .padding(.trailing)
                    .foregroundStyle(.red)
                    .opacity(prova.isImportante! ? 1.0 : 0.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .frame(width: 300, height: 100)
    }
}

#Preview {
    ProvaComponent(prova: Prova(titulo: "Logaritmos", materia: "Matemática", data: Date(), isImportante: false))
}
