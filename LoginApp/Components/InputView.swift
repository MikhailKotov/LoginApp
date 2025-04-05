//
//  InputView.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

struct InputView<Content: View, RightContent: View>: View {
  let title: String
  let subtitle: String?
  let state: InputState
  let content: () -> Content
  let rightContent: (() -> RightContent)?

  init(
    title: String,
    subtitle: String? = nil,
    state: InputState = .normal,
    @ViewBuilder content: @escaping () -> Content,
    rightContent: (() -> RightContent)? = nil
  ) {
    self.title = title
    self.subtitle = subtitle
    self.state = state
    self.content = content
    self.rightContent = rightContent
  }

  var body: some View {
    VStack(alignment: .leading, spacing: .Dimension.s) {
      HStack {
        Text(title)
          .label(.m)
          .foregroundColor(state == .error ? .Content.OnNeutral.danger : .Content.OnNeutral.xxHigh)
        if let subtitle {
          Text(subtitle)
            .label(.s)
            .foregroundColor(.Content.OnNeutral.low)
        }
      }
      ZStack(alignment: .trailing) {
        content()
        if let rightContent {
          rightContent()
        }
      }
    }
  }
}

#Preview {
  @Previewable @State var text1 = ""
  @Previewable @State var text2 = ""
  @Previewable @State var pass1 = ""
  @Previewable @State var pass2 = ""

  VStack (spacing: .Dimension.s) {
    TextInputView(
      title: "Title",
      isOptional: false,
      state: .normal,
      placeholder: "Placeholder",
      text: $text1,
      onEditingChanged: { print($0) })
    Divider()
    TextInputView(
      title: "Title",
      isOptional: true,
      state: .error,
      placeholder: "Placeholder",
      text: $text2,
      onEditingChanged: { print($0) })
    Divider()
    PasswordInputView(
      title: "Password",
      isValid: .constant(true),
      placeholder: "Password 1",
      text: $pass1,
    validators: [])
    Divider()
    PasswordInputView(
      title: "Password",
      isValid: .constant(true),
      placeholder: "Password 2",
      text: $pass2,
      validators: [])
    Spacer()
  }
  .padding(.Dimension.l)
}
