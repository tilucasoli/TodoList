//
//  ShowAllTasks.swift
//  TodoList
//
//  Created by Lucas Oliveira on 28/05/23.
//

import SwiftUI
import CoreData

struct ShowAllTasks: View {
  
  @StateObject var viewModel: ShowAllTasksViewModel

  var body: some View {
    NavigationView {
      List {
        TodoSection(title: "Todo",
                    tasks: viewModel.getAllTodoTasks()) { task in
          viewModel.toggleTaskCompletion(task: task)
        }
        TodoSection(title: "Done",
                    tasks: viewModel.getAllCompletedTasks()) { task in
          viewModel.toggleTaskCompletion(task: task)
        }
      }
      .navigationTitle("Todo App")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          NavigationLink {
            AddTask(viewModel: .init(taskStore: viewModel.taskStore))
          } label: {
            Image(systemName: "plus")
              .bold()
            .foregroundColor(.blue)
          }

        }
      }
    }
    .environmentObject(viewModel)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ShowAllTasks(viewModel: .init(taskStore: .init()))
  }
}
