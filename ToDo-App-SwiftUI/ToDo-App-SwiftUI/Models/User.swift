//
//  User.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
