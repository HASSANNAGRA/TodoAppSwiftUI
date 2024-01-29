//
//  ContentView.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty {
            account
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var account : some View {
        TabView {
             ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label ("Profile",systemImage:"person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
