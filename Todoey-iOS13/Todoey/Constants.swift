//
//  Constants.swift
//  Todoey
//
//  Created by Bach Pham on 16/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct K {
    static let todoListSegue = "goToListTodo"

    enum TableView {
        static let cell = "TodoItemCell"
        static let cateCell = "CateItemCell"
    }

    enum LocalStorageKey {
        static let todoListArray = "TodoListArray"
    }
}
