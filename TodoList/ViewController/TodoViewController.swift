//
//  TodoViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class TodoViewController: UIViewController {
	
	var catagory: Category!
	var todoListDelegate: CategoryDelegate!
	var categoryStoreDelegate: CategoryStoreDelegate!
	
	@IBAction func filterBy(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
			case 0:
				catagory.todoList.sort{ $0.dateCreated < $1.dateCreated }
				todoListDelegate.reloadCategory()
			
			case 1:
				catagory.todoList.sort{ $0.firstTitleChar < $1.firstTitleChar }
				todoListDelegate.reloadCategory()
			
			case 2:
				catagory.todoList.sort{ $0.date < $1.date }
				todoListDelegate.reloadCategory()
			default:
				break
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "showTodoList":
				let todoListListViewController = segue.destination as! TodoListViewController
				todoListListViewController.category = catagory
				todoListDelegate = todoListListViewController
				todoListListViewController.todoListDelegate = todoListDelegate
				todoListListViewController.categoryStoreDelegate = categoryStoreDelegate
				break
			case "showAddTodo":
				let addTodoViewController = segue.destination as! AddTodoViewController
				addTodoViewController.isEdit = false
				addTodoViewController.todoListDelegate = todoListDelegate
			case "showEditTodo":
				break
			default:
				print(segue.identifier!)
				fatalError("InvalidSegue")
		}
	}
	
	
	@IBAction func deleteTodoList(_ sender: UIButton) {
		
		let alertController = UIAlertController(title: "Delete Todo List", message: "are you sure you want to delete this list", preferredStyle: .actionSheet)
		
		let alertCancel = UIAlertAction(title: "cancle", style: .cancel,handler: nil)
		alertController.addAction(alertCancel)
		let alertDelete = UIAlertAction(title: "Delete", style: .destructive){
			_ in
			self.categoryStoreDelegate.deleteCategory(self.catagory)
			self.navigationController?.popViewController(animated: true)
		}
		alertController.addAction(alertDelete)
		present(alertController, animated: true, completion: nil)
		categoryStoreDelegate.deleteCategory(catagory)
		navigationController?.popViewController(animated: true)
	}
	
}
