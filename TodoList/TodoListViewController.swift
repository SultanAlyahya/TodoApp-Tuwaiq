//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class TodoListViewController: UITableViewController {
	
	var todoList: TodoList!
	var todoListDelegate: UpdateTodoListDelegate!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "showEditTodo":
				if let row = tableView.indexPathForSelectedRow?.row {
					let todo = todoList.todos[row]
					let addTodoViewController = segue.destination as! AddTodoViewController
					addTodoViewController.todo = todo
					addTodoViewController.isEdit = true
					addTodoViewController.todoListDelegate = todoListDelegate
				}
			default:
				break
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//print(todoList.DirectoryName)
		return todoList.todos.count
	}
	
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
		
		let todo = todoList.todos[indexPath.item]
		
		cell.setTodo(todo: todo)
		
		return cell
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}


extension TodoListViewController: UpdateTodoListDelegate {
	func updateTodo(todo: Todo) {
		if let index = todoList.todos.firstIndex(of: todo){
			let indexPath = IndexPath(row: index, section: 0)
			tableView.reloadRows(at: [indexPath], with: .automatic)
		}
	}
	
	func addTodo(todo: Todo) {
		todoList.addTodo(todo: todo)
		if let index = todoList.todos.firstIndex(of: todo){
			let indexPath = IndexPath(row: index, section: 0)
			tableView.insertRows(at: [indexPath], with: .automatic)
		}
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			todoList.removeTodo(index: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
		
	}
	
	override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		
		let context: UIContextualAction
		
		if todoList.todos[indexPath.row].isCompleted{
			context =  UIContextualAction(style: .normal, title: "Uncheck Todo", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
				print("Update action ...")
				self.changeItemToChecked(indexPath)
				success(true)
			})
			context.backgroundColor = .red
		}
		else {
			context =  UIContextualAction(style: .normal, title: "Check Todo", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
				print("Update action ...")
				self.changeItemToChecked(indexPath)
				success(true)
			})
			context.backgroundColor = .green
		}
		
		return UISwipeActionsConfiguration(actions: [context])
	}
	
	func changeItemToChecked(_ indexPath: IndexPath){
		todoList.toggleCheck(indexPath.row)
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
	
}
