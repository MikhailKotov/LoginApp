//
//  LabelMModifier.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

private struct LabelSModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter", size: 14))
            .fontWeight(.medium) // Weight 500
            .lineSpacing(17 - 14) // Line height adjustment
            .kerning(0.16)
    }
}

private struct LabelMModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter", size: 16))
            .fontWeight(.medium) // Weight 500
            .lineSpacing(22 - 16) // Line height adjustment
            .kerning(0.16)
    }
}

private struct BodyMModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter", size: 16))
            .fontWeight(.regular) // Weight 500
            .lineSpacing(22 - 16) // Line height adjustment
            .kerning(0.01)
    }
}

enum Style {
  enum Label {
    case s
    case m
  }
  enum Body {
    case m
  }
}

extension View {
  @ViewBuilder
  func label(_ value: Style.Label) -> some View {
    switch value {
    case .s:
      self.modifier(LabelSModifier())
    case .m:
      self.modifier(LabelMModifier())
    }
  }

  @ViewBuilder
  func body(_ value: Style.Body) -> some View {
    switch value {
    case .m:
      self.modifier(BodyMModifier())
    }
  }
}
