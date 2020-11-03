//
//  DirectoryListStore.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class DirectoryListStore {
	
	var todoLists = [TodoList]()
	
	init() {
		do{
			let todoData = try Data(contentsOf: todosURL)
			let decoder = PropertyListDecoder()
			let todos = try decoder.decode([TodoList].self, from: todoData)
			todoLists = todos
		}
		catch {
			print("error: \(error)")
		}
		let notificationCenter = NotificationCenter.default
		notificationCenter.addObserver(self,
									   selector: #selector(saveTodos),
									   name: UIScene.didEnterBackgroundNotification,
									   object: nil)
	}
	
	private var todosURL: URL {
		let directories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		let directory = directories.first!
		return directory.appendingPathComponent("todos.plist")
	}
	
	func addTodoList(todoList: TodoList){
		todoLists.append(todoList)
	}
	
	
	@objc func saveTodos(){
		do{
			let encoder = PropertyListEncoder()
			let todoData = try encoder.encode(todoLists)
			try todoData.write(to: todosURL, options: [.atomic])
			print("saved")
		} catch {
			print("error: \(error)")
		}
	}
	
}
