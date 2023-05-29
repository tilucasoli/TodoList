//
//  AddTaskViewModel.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import Foundation

class AddTaskViewModel: ObservableObject {

  @Published var taskStore: TaskStore

  @Published var title: String = ""
  @Published var description: String = ""
  @Published var isShowingAlert: Bool = false

  init(taskStore: TaskStore, title: String = "", description: String = "", isShowingAlert: Bool = false) {
    self.taskStore = taskStore
    self.title = title
    self.description = description
    self.isShowingAlert = isShowingAlert
  }

  func createTask() {
    if !title.isEmpty || !description.isEmpty {
      taskStore.tasks.append(.init(title: title, description: description))
      isShowingAlert.toggle()
    }
  }

}
