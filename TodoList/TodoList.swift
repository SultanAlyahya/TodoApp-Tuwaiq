//
//  TodoList.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation

class TodoList: Equatable, Codable {
	static func == (lhs: TodoList, rhs: TodoList) -> Bool {
		lhs.DirectoryName == rhs.DirectoryName
	}
	
	var todos = [Todo]()
	var numberOfTasks: Int = 0
	var numberOfComletedTasks: Int = 0
	let DirectoryName: String
	
	init(DirectoryName name: String){
		self.DirectoryName = name
	}
	
	func addTodo(todo: Todo) -> Void {
		todos.append(todo)
		numberOfTasks += 1
	}
	func removeTodo(index: Int){
		todos.remove(at: index)
	}
	
	func toggleCheck(_ index: Int){
		let completed = todos[index].isCompleted
		if completed {
			todos[index].isCompleted = false
			numberOfComletedTasks -= 1
		} else {
			todos[index].isCompleted = true
			numberOfComletedTasks += 1
		}
	}
	
}
