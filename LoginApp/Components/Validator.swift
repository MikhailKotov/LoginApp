//
//  Validator.swift
//  LoginApp
//
//  Created by Mykhailo Kotov on 05/04/2025.
//


protocol Validator {
  func validate(_ input: String) -> String?
}

struct LengthValidator: Validator {
  let minimumLength: Int
  func validate(_ input: String) -> String? {
    return input.count < minimumLength ? "* Minimálne \(minimumLength) znakov" : nil
  }
}

struct NumberValidator: Validator {
  func validate(_ input: String) -> String? {
    return input.contains(where: { $0.isNumber }) ? nil : "* Aspoň jedno číslo"
  }
}

struct UppercaseValidator: Validator {
  func validate(_ input: String) -> String? {
    return input.contains(where: { $0.isUppercase }) ? nil : "* Aspoň jedno veľké písmeno"
  }
}

struct SpecialValidator: Validator {
  func validate(_ input: String) -> String? {
    return input.contains(where: { "?=#/%".contains($0) }) ? nil : "* Aspoň jeden špeciálny znak (? = # / %)"
  }
}
