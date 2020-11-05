//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 17/03/1442 AH.
//

import UIKit

class AddTodoViewController: UIViewController {
	
	var todoListDelegate: CategoryDelegate!
	var isEdit: Bool!
	var todo: Todo!
	
	@IBOutlet var todoTitle: UITextField!
	@IBOutlet var todoDate: UIDatePicker!
	@IBOutlet var todoDescrition: UITextView!
	@IBOutlet var updateButton: UIButton!
	
	
	@IBAction func updateTodoList(_ sender: UIButton) {
		
		if isEdit {
			print(todo!)
			todo.title = todoTitle.text ?? ""
			todo.description = todoDescrition.text ?? ""
			todo.date = todoDate.date
			self.todoListDelegate.updateTodo(todo: todo)
			navigationController?.popViewController(animated: true)
		} else {
			let todo = Todo(title: todoTitle.text!, description: todoDescrition.text!, date: todoDate.date)
			self.todoListDelegate.addTodo(todo: todo)
			navigationController?.popViewController(animated: true)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if isEdit {
			
			print(todo.date)
			todoTitle.text = todo.title
			todoDescrition.text = todo.description
			todoDate.date = todo.date
			updateButton.backgroundColor = .blue
			updateButton.setTitle("Edit", for: .normal)
		}else{
			isEdit = false
		}
	}
	
}
