//
//  AddTask.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import SwiftUI

struct AddTask: View {

  @StateObject var viewModel: AddTaskViewModel

  var onSave: ((TodoTask) -> Void)

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
        Button("Continue", role: .cancel) {
          onSave(viewModel.createTask())
          viewModel.title = ""
          viewModel.description = ""
        }
      }
    }
    .navigationTitle("Adding task")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      Button("Create") {
        viewModel.isShowingAlert = true
      }
    }
  }
}

struct AddTask_Previews: PreviewProvider {
  static var previews: some View {
    AddTask(viewModel: .init(tasks: [.init(title: "teste", description: "teste")])) { newTask in
      print(newTask.title)
    }
  }
}
