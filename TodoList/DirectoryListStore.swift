//
//  DirectoryListStore.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation

class DirectoryListStore {
	
	var todoLists = [TodoList]()
	
	func addTodoList(todoList: TodoList){
		todoLists.append(todoList)
	}
	
	
}
