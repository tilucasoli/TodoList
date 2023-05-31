//
//  AddTaskViewModel.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import Foundation

class AddTaskViewModel: ObservableObject {

  var tasks: [TodoTask]

  @Published var title: String = ""
  @Published var description: String = ""
  @Published var isShowingAlert: Bool = false

  init(tasks: [TodoTask], title: String = "", description: String = "", isShowingAlert: Bool = false) {
    self.tasks = tasks
    self.title = title
    self.description = description
    self.isShowingAlert = isShowingAlert
  }

  func createTask() -> TodoTask {
    .init(title: title, description: description)
  }

}
