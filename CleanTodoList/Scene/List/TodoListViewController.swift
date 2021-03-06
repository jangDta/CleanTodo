//
//  TodoListViewController.swift
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

protocol TodoListDisplayLogic: class
{
    func displayFetchTodoList(viewModel: TodoList.FetchTodoList.ViewModel)
}

class TodoListViewController: UIViewController, TodoListDisplayLogic
{
    var interactor: TodoListBusinessLogic?
    var router: (NSObjectProtocol & TodoListRoutingLogic & TodoListDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter()
        let router = TodoListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTodoList()
    }
    
    @IBOutlet weak var todoListTableView: UITableView!
    var displayedTodos: [TodoList.DisplayedTodo]?
    
    // MARK: Set TableView
    
    func setUpTableView() {
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
    }
    
    // MARK: Fetch TodoList
    
    func fetchTodoList() {
        let request = TodoList.FetchTodoList.Request()
        interactor?.fetchTodoList(request: request)
    }
    
    func displayFetchTodoList(viewModel: TodoList.FetchTodoList.ViewModel)
    {
        displayedTodos = viewModel.displayedTodos
        todoListTableView.reloadData()
    }
    
    // MARK: Select Todo
    
    func selectTodo(at index: Int) {
        let request = TodoList.SelectTodo.Request(index: index)
        interactor?.selectTodo(request: request)
        router?.routeToDetail(segue: nil)
    }
}

// MARK: UITableViewController

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedTodos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTodo(at: indexPath.row)
    }
}

// MARK: UITableViewCell

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoListTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        guard let todo = displayedTodos?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.time
        
        return cell
    }
}
