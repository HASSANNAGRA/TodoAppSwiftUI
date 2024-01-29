//
//  ToDoListItemView.swift
//  ToDo-App-SwiftUI
//
//  Created by Hassan Azhar on 05/01/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item :ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font (.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button
            {
                viewModel.toogleIsDone(item: item)
            } label: {
                Image (systemName: item.isDone ?
                       "checkmark.circle.fill" : "circle")
                .foregroundColor(.blue)
            }
        }
    }
}
#Preview {
    ToDoListItemView(item: ToDoListItem(id: "123",
                                        title: "This is title", dueDate:Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
