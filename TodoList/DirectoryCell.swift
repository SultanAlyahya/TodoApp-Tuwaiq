//
//  DirectoryCell.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class DirectoryCell: UICollectionViewCell {
	
	@IBOutlet var directoryTitle: UILabel!
	@IBOutlet var numberOfTasks: UILabel!
	@IBOutlet var numberOfComletedTasks: UILabel!
	
	func uddate(_ todoList: TodoList){
		directoryTitle.text = todoList.DirectoryName
		numberOfTasks.text = "All Tasks: \(todoList.numberOfTasks)"
		numberOfComletedTasks.text = "Completed Tasks: \(todoList.numberOfComletedTasks)"
	}
		
}
