//
//  LoginView.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var viewModel = LoginViewModel()

  var body: some View {
    VStack {
      PasswordInputView(
        title: "Heslo",
        isValid: $viewModel.isValid,
        placeholder: "Zadajte heslo",
        text: $viewModel.password,
        validators: [
          LengthValidator(minimumLength: 8),
          NumberValidator(),
          UppercaseValidator(),
          SpecialValidator()
        ]
      )
      .padding(.top, 100)
      if viewModel.isValid {
        Image(systemName: "checkmark.seal")
          .symbolRenderingMode(.palette)
          .foregroundStyle(.green, .blue)
          .font(.system(size: 144))
      } else {
        Image(systemName: "xmark.seal")
          .symbolRenderingMode(.palette)
          .foregroundStyle(.red, .orange)
          .font(.system(size: 144))
      }
      Spacer()
    }
    .padding()
  }
}

#Preview {
  LoginView()
}
