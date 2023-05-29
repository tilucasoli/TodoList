//
//  ShowAllTasksViewModel.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import Foundation

class ShowAllTasksViewModel: ObservableObject {
  @Published var taskStore: TaskStore

  init(taskStore: TaskStore) {
    self.taskStore = taskStore
  }

  func getAllCompletedTasks() -> [TodoTask] {
    taskStore.tasks
      .filter {$0.isCompleted}
      .sorted { $0.lastChange > $1.lastChange}
  }

  func getAllTodoTasks() -> [TodoTask] {
    taskStore.tasks
      .filter {!$0.isCompleted}
      .sorted { $0.lastChange > $1.lastChange}
  }

  func deleteTask(task: TodoTask) {
    let index = taskIndex(for: task)
    if let index {
      taskStore.tasks.remove(at: index)
    }
  }

  func taskIndex(for task: TodoTask) -> Int? {
    taskStore.tasks.firstIndex(where: { $0.id == task.id })
  }

  func toggleTaskCompletion(task: TodoTask) {
    if let index = taskIndex(for: task) {
      taskStore.tasks[index].isCompleted.toggle()
      taskStore.tasks[index].lastChange = .now
    }
  }
}
