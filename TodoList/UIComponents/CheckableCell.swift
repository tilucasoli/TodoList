//
//  CheckableCell.swift
//  TodoList
//
//  Created by Lucas Oliveira on 29/05/23.
//

import SwiftUI

struct CheckableCell: View {
  let title: String
  let description: String
  
  var isOn: Bool

  var body: some View {
    HStack(alignment: .top, spacing: 16) {
      Checkbox(isOn: isOn)
      VStack(alignment: .leading, spacing: 6) {
        Text(title)
          .font(.headline)
          .strikethrough(isOn)
          .frame(height: 20)
        Text(description)
          .font(.subheadline)
          .strikethrough(isOn)
      }
    }
  }
}

fileprivate struct CheckableCell_State_Preview: View {
  @State var isOn: Bool = false

  var body: some View {
    CheckableCell(title: "Ir para a Academia",
                  description: "Preciso ir para a greenlife hoje as 7 horas da noite",
                  isOn: isOn)
    .onTapGesture {
      isOn.toggle()
    }
  }
}

struct CheckableCell_Previews: PreviewProvider {
  static var previews: some View {
    CheckableCell_State_Preview()
  }
}
