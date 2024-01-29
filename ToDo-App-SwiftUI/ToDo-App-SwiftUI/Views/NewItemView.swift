//
//  NewItemView.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    @Binding var showingNewItemView : Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top,60)
            Form {
                // title
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                // button
                TLButton(title: "Save",
                         backgroung: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        showingNewItemView = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer")
                )
            })
        }
    }
}

#Preview {
    NewItemView(showingNewItemView: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
