//
//  TaskListView.swift
//  TaskList
//
//  Created by Caio Soares on 22/08/24.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationStack {
            
            //MARK: - Listagem principal
            
            List {
                Section {
                    ForEach($viewModel.tarefas, id: \.self) { $tarefa in
                        NavigationLink {
                            TaskDetailView(tarefa: $tarefa, deleteTask: {
                                self.viewModel.removeTask(idParaDeletar: tarefa.id)
                            })
                        } label: {
                            Text(tarefa.nome)
                        }
                    }.onDelete { index in
                        viewModel.removeTask(index: index)
                    }
                }
            }
            
            //MARK: - Botões de Debug
            
            HStack {
                
                Button {
                    viewModel.initTests()
                } label: {
                    Text("Testar")
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                
                Button {
                    viewModel.load()
                } label: {
                    Text("Carregar")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                Button {
                    viewModel.save()
                } label: {
                    Text("Salvar")
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                
                Button {
                    viewModel.delete()
                } label: {
                    Text("Delete")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

            }
            
            //MARK: - Toolbar
            
            .navigationTitle("Tarefas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    viewModel.adicionandoTarefa = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            //MARK: - Sheet de adicionar tarefa
            
            .sheet(isPresented: $viewModel.adicionandoTarefa) {
                TextField("Nome da tarefa", text: $viewModel.nomeNovaTarefa)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                Button {
                    viewModel.addTask()
                } label: {
                    Text("Adicionar")
                }

            }
        }
    }
    
}

#Preview {
    TaskListView()
}
