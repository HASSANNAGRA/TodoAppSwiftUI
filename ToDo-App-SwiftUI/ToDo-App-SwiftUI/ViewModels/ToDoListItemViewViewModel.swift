//
//  ToDoListItemViewViewModel.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListItemViewViewModel : ObservableObject {
    
    func toogleIsDone(item:ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document (uid)
            .collection ("todos")
            .document (itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
