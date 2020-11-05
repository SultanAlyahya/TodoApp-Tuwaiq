//
//  DirectoryListStore.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class CategoryStore {
	
	var categories = [Category]()
	
	init() {
		DispatchQueue.global(qos: .background).async {
			do{
				let todoData = try Data(contentsOf: self.todosURL)
				let decoder = PropertyListDecoder()
				let todos = try decoder.decode([Category].self, from: todoData)
				self.categories = todos
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
	
	func addTodoList(todoList: Category){
		categories.append(todoList)
	}
	
	
	@objc func saveTodos(){
		
		DispatchQueue.global(qos: .background).async {
			do{
				let encoder = PropertyListEncoder()
				let todoData = try encoder.encode(self.categories)
				try todoData.write(to: self.todosURL, options: [.atomic])
					print("saved")
				} catch {
					print("error: \(error)")
				}
			}
		}
	
}
