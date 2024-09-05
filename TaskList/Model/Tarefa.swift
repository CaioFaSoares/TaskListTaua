//
//  Tarefa.swift
//  TaskList
//
//  Created by Caio Soares on 26/08/24.
//

import Foundation

struct Tarefa: Identifiable, Hashable, Codable {
    let id = UUID()
    var nome = ""
    var description = ""
    var date = Date.now
    var pronta = false
}

extension Tarefa {
    static let mock: Tarefa = .init(nome: "Tarefa Mock", description: "Tarefa Mock", date: .now)
}
