//
//  TodoListWorker.swift
//  CleanTodoList
//
//  Created by 장용범 on 2021/01/21.
//  Copyright (c) 2021 장용범. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class TodoListWorker
{
    func fetchTodoList() -> [Todo] {
        TodoStore.shared.todoList()
    }
}