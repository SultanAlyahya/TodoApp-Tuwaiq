//
//  TodoCell.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class TodoCell: UITableViewCell {
	
	@IBOutlet var todoTitle: UILabel!
	@IBOutlet var todoDate: UILabel!
	@IBOutlet var todoDescription: UILabel!
	
	@IBOutlet var todoCheckImage: UIImageView!
	
	func setTodo(todo: Todo){
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		todoTitle.text = todo.title
		todoDate.text = dateFormatter.string(from: todo.date)
		todoDescription.text = todo.description
		if todo.isCompleted{
			todoCheckImage.image = .checkmark
		} else {
			todoCheckImage.image = nil
		}
	}
	
	func chech(){
		
	}
	
}
