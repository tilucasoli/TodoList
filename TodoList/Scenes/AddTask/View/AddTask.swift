//
//  AddTask.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import SwiftUI

struct AddTask: View {

  @StateObject var viewModel: AddTaskViewModel

  var body: some View {
    NavigationView {
      VStack {
        List {
          Section("Title") {
            TextField("ex: Ir para o Academy", text: $viewModel.title)
          }
          Section("Description") {
            TextEditor(text: $viewModel.description)
              .frame(minHeight: 60)
          }
        }
      }
      .alert(Text("A new Task was added"), isPresented: $viewModel.isShowingAlert) {
        Button("Continue", role: .cancel) {}
      }
    }
    .navigationTitle("Adding task")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      Button("Create") {
        viewModel.createTask()
      }
    }
  }
}

struct AddTask_Previews: PreviewProvider {
  static var previews: some View {
    AddTask(viewModel: .init(taskStore: .init()))
  }
}
