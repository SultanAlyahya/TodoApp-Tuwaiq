//
//  TodoList.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation

class Category: Equatable, Codable {
	static func == (lhs: Category, rhs: Category) -> Bool {
		lhs.dateCreated == rhs.dateCreated
	}
	
	var todoList = [Todo]()
	var numberOfTasks: Int = 0
	var numberOfComletedTasks: Int = 0
	let DirectoryName: String
	private var dateCreated = Date()
	
	init(DirectoryName name: String){
		self.DirectoryName = name
	}
	
	func addTodo(todo: Todo) -> Void {
		todoList.append(todo)
		numberOfTasks += 1
	}
	func removeTodo(index: Int){
		numberOfTasks -= 1
		if todoList[index].isCompleted {
			numberOfComletedTasks -= 1
		}
		todoList.remove(at: index)
	}
	
	func toggleCheck(_ index: Int){
		let completed = todoList[index].isCompleted
		if completed {
			todoList[index].isCompleted = false
			numberOfComletedTasks -= 1
		} else {
			todoList[index].isCompleted = true
			numberOfComletedTasks += 1
		}
	}
	
	func toggleNotification(_ index: Int){
		let todo = todoList[index]
		if todo.needNotification {
			todo.removeNotification()
		}
		else{
			todo.sendNotification()
		}
	}
	
}
