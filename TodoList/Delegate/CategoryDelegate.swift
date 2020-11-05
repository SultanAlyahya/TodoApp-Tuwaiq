//
//  UpdateTodoListDelegate.swift
//  TodoList
//
//  Created by Sultan alyahya on 17/03/1442 AH.
//

import Foundation

protocol CategoryDelegate {
	func addTodo(todo: Todo)
	func updateTodo(todo: Todo)
	func reloadCategory()
}
