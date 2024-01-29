//
//  ToDo_App_SwiftUIApp.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDo_App_SwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
