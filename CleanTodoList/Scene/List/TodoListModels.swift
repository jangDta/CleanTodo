//
//  TodoListModels.swift
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

enum TodoList
{
    struct DisplayedTodo {
        let title: String
        let time: String
    }
    
    // MARK: Fetch
    
    enum FetchTodoList
    {
        struct Request {}
        struct Response {
            let todos: [Todo]
        }
        struct ViewModel {
            let displayedTodos: [DisplayedTodo]
        }
    }
    
    // MARK: Select
    
    enum SelectTodo
    {
        struct Request {
            let index: Int
        }
        struct Response {}
        struct ViewModel {}
    }
}