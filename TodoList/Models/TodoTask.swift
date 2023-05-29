//
//  TodoTask.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import Foundation

struct TodoTask: Identifiable, Equatable {
  var id: UUID = .init()
  var title: String
  var description: String
  var isCompleted: Bool = false
  var lastChange: Date = Date()
}
