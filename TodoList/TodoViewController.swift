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
	var updateCollection: UpdateCollectionDelegate!
	
	@IBAction func filterBy(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
			case 0:
				todoList.todos.sort{ $0.dateCreated < $1.dateCreated }
				todoListDelegate.reloadTodoList()
			
			case 1:
				todoList.todos.sort{ $0.firstTitleChar < $1.firstTitleChar }
				todoListDelegate.reloadTodoList()
			
			case 2:
				todoList.todos.sort{ $0.date < $1.date }
				todoListDelegate.reloadTodoList()
			default:
				break
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "showTodoList":
				let todoListListViewController = segue.destination as! TodoListViewController
				todoListListViewController.todoList = todoList
				todoListDelegate = todoListListViewController
				todoListListViewController.todoListDelegate = todoListDelegate
				todoListListViewController.updateCollection = updateCollection
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
	
	
	@IBAction func deleteTodoList(_ sender: UIButton) {
		
		let alertController = UIAlertController(title: "Delete Todo List", message: "are you sure you want to delete this list", preferredStyle: .actionSheet)
		
		let alertCancel = UIAlertAction(title: "cancle", style: .cancel,handler: nil)
		alertController.addAction(alertCancel)
		let alertDelete = UIAlertAction(title: "Delete", style: .destructive){
			_ in
			self.updateCollection.deleteTodoList(self.todoList)
			self.navigationController?.popViewController(animated: true)
		}
		alertController.addAction(alertDelete)
		present(alertController, animated: true, completion: nil)
		updateCollection.deleteTodoList(todoList)
		navigationController?.popViewController(animated: true)
	}
	
}
