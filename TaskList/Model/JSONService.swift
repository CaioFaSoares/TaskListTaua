//
//  Untitled.swift
//  TaskList
//
//  Created by Caio Soares on 28/08/24.
//

import Foundation

class JSONManager {
    
    private let fileName: String = "tasks.json"

    // Método para obter o URL do arquivo JSON no diretório de documentos
    private func getFileURL() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentDirectory.appendingPathComponent(fileName)
    }

    // Método para salvar um array de tarefas no arquivo JSON
    func save(_ tarefas: [Tarefa]) throws {
        guard let fileURL = getFileURL() else { return }

        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(tarefas)
            try jsonData.write(to: fileURL)
        } catch {
            throw error
        }
    }

    // Método para carregar um array de tarefas do arquivo JSON
    func load() throws -> [Tarefa]? {
        guard let fileURL = getFileURL() else { return nil }

        if FileManager.default.fileExists(atPath: fileURL.path) {
            let decoder = JSONDecoder()
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let decodedData = try decoder.decode([Tarefa].self, from: jsonData)
                return decodedData
            } catch {
                throw error
            }
        } else {
            return nil
        }
    }
}
