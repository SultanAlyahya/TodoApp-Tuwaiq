//
//  Todo.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation

class Todo: Equatable {
	static func == (lhs: Todo, rhs: Todo) -> Bool {
		return lhs.title == rhs.title && lhs.date == rhs.date
	}
	
	var title: String
	var description: String
	var date: Date
	var isCompleted = false
	
	init (title: String, description: String, date: Date){
		self.title = title
		self.description = description
		self.date = date
	}
}
