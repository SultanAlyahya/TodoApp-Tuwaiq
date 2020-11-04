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
		DispatchQueue.global(qos: .background).async {
			do{
				let todoData = try Data(contentsOf: self.todosURL)
				let decoder = PropertyListDecoder()
				let todos = try decoder.decode([TodoList].self, from: todoData)
				self.todoLists = todos
			}
			catch {
				print("error: \(error)")
			}
			let notification = Notification(name: Notification.Name(rawValue: "directoryLoaded"),
											object: self,
											userInfo: nil)
			NotificationCenter.default.post(notification)
		}
		let notificationCenter = NotificationCenter.default
		notificationCenter.addObserver(self,
									   selector: #selector(self.saveTodos),
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
		
		DispatchQueue.global(qos: .background).async {
			do{
				let encoder = PropertyListEncoder()
				let todoData = try encoder.encode(self.todoLists)
				try todoData.write(to: self.todosURL, options: [.atomic])
					print("saved")
				} catch {
					print("error: \(error)")
				}
			}
		}
	
}
