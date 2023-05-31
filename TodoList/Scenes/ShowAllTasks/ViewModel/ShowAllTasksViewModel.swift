//
//  ShowAllTasksViewModel.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import Foundation

class ShowAllTasksViewModel: ObservableObject {
  @Published var tasks: [TodoTask] = [.init(title: "Ir para a Academia",
                                            description: "Preciso ir para a greenlife hoje as 7 horas da noite",
                                            isCompleted: true),
                                      .init(title: "Fazer apresentação sobre MVVM",
                                            description: "Tem que contemplar assuntos como: o que é arquitetura, MVVM e MV")]

  init(tasks: [TodoTask]) {
    self.tasks = tasks
  }

  func getAllCompletedTasks() -> [TodoTask] {
    tasks
      .filter {$0.isCompleted}
      .sorted { $0.lastChange > $1.lastChange}
  }

  func getAllTodoTasks() -> [TodoTask] {
    tasks
      .filter {!$0.isCompleted}
      .sorted { $0.lastChange > $1.lastChange}
  }

  func createTask(task: TodoTask) {
    tasks.append(task)
  }

  func deleteTask(task: TodoTask) {
    let index = taskIndex(for: task)
    if let index {
      tasks.remove(at: index)
    }
  }

  func taskIndex(for task: TodoTask) -> Int? {
    tasks.firstIndex(where: { $0.id == task.id })
  }

  func toggleTaskCompletion(task: TodoTask) {
    if let index = taskIndex(for: task) {
      tasks[index].isCompleted.toggle()
      tasks[index].lastChange = .now
    }
  }
}
