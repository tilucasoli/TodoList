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
          ShowAllTasks(viewModel: .init(taskStore: .init()))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
