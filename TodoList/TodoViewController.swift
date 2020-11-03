//
//  TodoViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class TodoViewController: UIViewController {
	
	var todoList: TodoList!
	var todoListDelegate: UpdateTodoListDelegate!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "showTodoList":
				let todoListListViewController = segue.destination as! TodoListViewController
				todoListListViewController.todoList = todoList
				todoListDelegate = todoListListViewController
				todoListListViewController.todoListDelegate = todoListDelegate
				break
			case "showAddTodo":
				let addTodoViewController = segue.destination as! AddTodoViewController
				addTodoViewController.isEdit = false
				addTodoViewController.todoListDelegate = todoListDelegate
			case "showEditTodo":
				break
			default:
				print(segue.identifier)
				fatalError("InvalidSegue")
		}
	}
	
}
