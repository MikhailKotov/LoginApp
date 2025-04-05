//
//  TextInputView.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//


import SwiftUI

struct TextInputView: View {
  let title: String
  let isOptional: Bool
  let state: InputState
  let placeholder: String

  @Binding var text: String
  let onEditingChanged: ((Bool) -> Void)?

  var body: some View {
    InputView(
      title: title,
      subtitle: isOptional ? "Optional" : nil,
      state: state
    ) {
      TextField(placeholder, text: $text, onEditingChanged: { isEditing in
        onEditingChanged?(isEditing)
      })
      .textFieldStyle(for: state)
    } rightContent: {
      EmptyView()
    }
  }
}