//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
  @Published var password: String = ""
  @Published var isValid: Bool = false
}
