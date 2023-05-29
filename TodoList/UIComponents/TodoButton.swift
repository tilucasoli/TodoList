//
//  TodoButton.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import SwiftUI

struct TodoButton: View {

  let title: String
  let action: () -> Void

  init(_ title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }

  var body: some View {
    Button(action: action) {
      Text(title)
        .bold()
        .foregroundColor(.white)
        .padding(8)
    }
    .buttonStyle(.borderedProminent)
    .tint(.blue)

  }
}

struct TodoButton_Previews: PreviewProvider {
  static var previews: some View {
    TodoButton("Lucas") {

    }
  }
}
