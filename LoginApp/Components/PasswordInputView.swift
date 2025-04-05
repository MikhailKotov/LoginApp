//
//  PasswordInputView.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

struct PasswordInputView: View {
  let title: String
  @Binding var isValid: Bool
  let placeholder: String
  @Binding var text: String
  let validators: [Validator]

  @State private var isPasswordVisible: Bool = false
  @State private var errors: String = ""

  var body: some View {
    let state: InputState = isValid ? .normal : .error
    VStack (alignment: .leading, spacing: .Dimension.s) {
      InputView(
        title: title,
        subtitle: nil,
        state: state
      ) {
        if isPasswordVisible {
          TextField(placeholder, text: $text)
            .textFieldStyle(for: state)
        } else {
          SecureField(title, text: $text)
            .textFieldStyle(for: state)
        }
      } rightContent: {
        Button(action: {
          isPasswordVisible.toggle()
        }) {
          Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
            .foregroundColor(.Surface.xLow)
        }
        .padding(.trailing, .Dimension.s)
      }
      if !isValid {
        Text(errors)
          .label(.s)
          .foregroundColor(.Content.OnNeutral.danger)
          .fixedSize(horizontal: false, vertical: true)
      }
    }
    .onChange(of: text) { _, newValue in
      let err = validators.compactMap{ $0.validate(newValue)}.joined(separator: "\n")
      isValid = err.isEmpty
      errors = err
    }
    .onAppear() {
      let err = validators.compactMap{ $0.validate(self.text)}.joined(separator: "\n")
      isValid = err.isEmpty
      errors = err
    }
  }
}
