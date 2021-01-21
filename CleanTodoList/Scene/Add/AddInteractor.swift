//
//  AddInteractor.swift
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

protocol AddBusinessLogic
{
  func addTodo(request: Add.AddTodo.Request)
}

protocol AddDataStore
{
}

class AddInteractor: AddBusinessLogic, AddDataStore
{
  var presenter: AddPresentationLogic?
  var worker: AddWorker? = AddWorker()
  
  // MARK: Add Todo
  
  func addTodo(request: Add.AddTodo.Request)
  {
    guard let todo = request.todo else { return }
    worker?.addTodo(todo: todo)
  }
}
