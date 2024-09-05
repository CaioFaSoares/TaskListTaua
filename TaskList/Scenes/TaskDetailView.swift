//
//  TaskDetailView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Binding var tarefa: Tarefa
    var deleteTask: () -> Void
    
    var body: some View {
        List {
            Section {
                Text(tarefa.nome).font(.headline)
                Text(tarefa.description)
                HStack(alignment: .top) {
                    Spacer()
                    Text("Criada em")
                        .font(.caption)
                    Text(String(tarefa.date.formatted()))
                }
            }
            Section {
//                Toggle("Finalizada?", isOn: $tarefa.pronta)
                Button("Deletar tarefa") {
                    deleteTask()
                }.foregroundColor(.red)
            }
        }
    }
}

#Preview {
    TaskDetailView(tarefa: .constant(Tarefa.mock),
                   deleteTask: {
        print("Tested")
    })
}

