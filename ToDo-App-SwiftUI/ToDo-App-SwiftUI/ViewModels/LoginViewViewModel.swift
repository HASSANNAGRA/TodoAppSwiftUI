//
//  Login.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//

import Foundation
import FirebaseAuth


class LoginViewViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please fill in all fields"
                  return false
              }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email "
            return false
        }
        return true
    }
}
