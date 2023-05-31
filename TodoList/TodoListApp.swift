//
//  TodoListApp.swift
//  TodoList
//
//  Created by Lucas Oliveira on 28/05/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          ShowAllTasks(viewModel: .init(tasks: [.init(title: "ir para academy", description: "No ifce Benfica"),
                                                .init(title: "Fazer prova", description: "Prova de POO")]))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
