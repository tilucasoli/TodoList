//
//  Checkbox.swift
//  TodoList
//
//  Created by Lucas Oliveira on 28/05/23.
//

import SwiftUI

struct Checkbox: View {
  var isOn: Bool

  let width = 20.0
  let height = 20.0

  var body: some View {
    RoundedRectangle(cornerRadius: 4)
      .stroke(.gray.opacity(0.5), lineWidth: 2)
      .frame(width: width, height: height)
      .overlay {
        ZStack {
          RoundedRectangle(cornerRadius: 4)
            .foregroundColor(.blue)
            .frame(width: isOn ? width : 0, height: isOn ? height : 0)
          Image(systemName: "checkmark")
            .resizable()
            .foregroundColor(.white)
            .frame(width: isOn ? width*0.6 : 0, height: isOn ? height*0.6 : 0)
        }
        .animation(.easeInOut(duration: 0.1), value: isOn)

      }
  }
}

fileprivate struct Checkbox_State_Preview: View {
  @State var isOn: Bool = false

  var body: some View {
    Checkbox(isOn: isOn)
      .onTapGesture {
        isOn.toggle()
      }
  }
}

struct Checkbox_Previews: PreviewProvider {
  static var previews: some View {
    Checkbox_State_Preview()
  }
}
