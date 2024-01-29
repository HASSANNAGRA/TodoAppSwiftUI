//
//  RegisterView.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//

import SwiftUI

struct RegisterView: View {
   @State var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack
        {
            // Header
            HeaderView(title: "Register", subTitle: "start organizing todos", angle: 15, background: .orange)
            Form {
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TLButton(title: "Create Account", backgroung: .green)
                {
                    viewModel.register()
                    
                }
                .padding()
            }
            .offset(y:-50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
