//
//  TaskStore.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import Foundation

//protocol Repository {
//  func add()
//}

class TaskStore: ObservableObject {
  @Published var tasks: [TodoTask] = [.init(title: "Ir para a Academia",
                                 description: "Preciso ir para a greenlife hoje as 7 horas da noite",
                                 isCompleted: true),
                           .init(title: "Fazer apresentação sobre MVVM",
                                 description: "Tem que contemplar assuntos como: o que é arquitetura, MVVM e MV")]
}
