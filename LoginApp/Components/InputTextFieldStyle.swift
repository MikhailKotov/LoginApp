//
//  InputTextFieldStyle.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

struct InputTextFieldStyle: TextFieldStyle {
  let state: InputState

  func _body(configuration: TextField<_Label>) -> some View {
    configuration
      .padding(.horizontal, .Dimension.s)
      .padding(.vertical, .Dimension.xs)
      .background(
        RoundedRectangle(cornerRadius: .Dimension.Radius.input)
          .stroke(state == .error ? Color.Content.OnNeutral.danger : Color.Surface.xLow, lineWidth: 1)
      )
      .foregroundColor(Color.Content.OnNeutral.xxHigh)
  }
}

extension TextField {
  func textFieldStyle(for state: InputState) -> some View {
    self.textFieldStyle(InputTextFieldStyle(state: state))
  }
}

extension SecureField {
  func textFieldStyle(for state: InputState) -> some View {
    self.textFieldStyle(InputTextFieldStyle(state: state))
  }
}
