//
//  UpdateCollectionDelegate.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation

protocol UpdateCollectionDelegate {
	func addTodoList(_ todoListName: String)
	func deleteTodoList(_ todoList: TodoList)
	func updateTodoList(_ todoList: TodoList)
	func reloadCollection()
}
