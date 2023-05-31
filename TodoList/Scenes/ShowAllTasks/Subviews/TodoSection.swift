//
//  TodoSection.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import SwiftUI

struct TodoSection: View {
  let title: String
  let tasks: [TodoTask]
  let onTapGestureOnCell: (TodoTask) -> Void
  
  @EnvironmentObject private var viewModel: ShowAllTasksViewModel
  
  var body: some View {
    Section(title) {
      ForEach(tasks) { task in
        CheckableCell(title: task.title,
                      description: task.description,
                      isOn: task.isCompleted)
        .onTapGesture {
          onTapGestureOnCell(task)
        }
        .swipeActions {
          Button {
            viewModel.deleteTask(task: task)
          } label: {
            Image(systemName: "trash.fill")
          }
          .tint(.red)
          
        }
      }
    }
  }
}

struct TodoSection_Previews: PreviewProvider {
  static var previews: some View {
    List {
      TodoSection(title: "Todo",
                  tasks: [.init(title: "ir para academia",
                                description: "fazer 3 series de levantamento terra")]) { _ in
        print("clicado")
      }
    }
  }
}
