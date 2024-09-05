//
//  TaskListViewModel.swift
//  TaskList
//
//  Created by Caio Soares on 05/09/24.
//

import SwiftUI

class TaskListViewModel: ObservableObject {
    
    @Published var tarefas: [Tarefa] = []
    
    @Published var adicionandoTarefa = false
    @Published var nomeNovaTarefa = ""
    
    private let json = JSONService()
    
    init() {
        
    }
    
    //MARK: - Comportamentos
    
    func initTests() {
        tarefas = [
            Tarefa(nome: "Comprar pão"),
            Tarefa(nome: "Jogar Elden Ring"),
            Tarefa(nome: "Resolver exercício de matemática"),
            Tarefa(nome: "Estudar Swift"),
            Tarefa(nome: "Fazer exercício físico"),
            Tarefa(nome: "Ler um livro"),
            Tarefa(nome: "Enviar e-mails"),
            Tarefa(nome: "Limpar a casa"),
            Tarefa(nome: "Organizar documentos"),
            Tarefa(nome: "Preparar almoço")
        ]
    }
    
    func load() {
        do {
            try tarefas = json.load() ?? []
        } catch {}
    }
    
    func save() {
        do {
            try json.save(tarefas)
        } catch {}
    }
    
    func delete() {
        do {
            try json.delete()
            tarefas = []
        } catch {}
    }
    
    func removeTask(index: IndexSet) {
        tarefas.remove(atOffsets: index)
        save()
    }
    
    func removeTask(idParaDeletar: UUID) {
        tarefas.removeAll(where: { $0.id == idParaDeletar })
        save()
    }
    
    func addTask() {
        if nomeNovaTarefa.isEmpty == false {
            let novaTarefa = Tarefa(nome: nomeNovaTarefa)
            tarefas.append(novaTarefa)
            nomeNovaTarefa = ""
            adicionandoTarefa = false
            save()
        }
    }
    
}
