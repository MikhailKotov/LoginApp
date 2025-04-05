//
//  Colors.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

extension Color {
  enum Surface {
    static let xHigh = Colors.Core.Gray._00
    static let xLow = Colors.Core.Gray._500
  }

  struct Content {
    struct OnNeutral {
      static let xxHigh = Colors.Core.Gray._950
      static let low = Colors.Core.Gray._300
      static let danger = Colors.Core.Red._600
    }
  }
}
