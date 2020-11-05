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
	@IBOutlet var notificationImage: UIImageView!
	
	func setTodo(todo: Todo){
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		todoTitle.text = todo.title
		todoDate.text = dateFormatter.string(from: todo.date)
		todoDescription.text = todo.description
		if todo.date < Date(){
			todoDate.textColor = .red
		}
		if todo.isCompleted{
			todoCheckImage.image = UIImage(systemName: "checkmark.seal.fill")
		} else {
			todoCheckImage.image = nil
		}
		if todo.needNotification{
			notificationImage.image = UIImage(systemName: "alarm.fill")
		} else {
			notificationImage.image = nil
		}
		
		
	}
	
	func chech(){
		
	}
	
}
