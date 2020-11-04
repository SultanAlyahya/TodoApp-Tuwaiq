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
//	@IBOutlet var progressLine: UIView!
//	@IBOutlet var backgroundProgressLine: UIView!
	@IBOutlet var progressLine: UIProgressView!
	
	func uddate(_ todoList: TodoList){
		directoryTitle.text = todoList.DirectoryName
		numberOfTasks.text = "All Tasks: \(todoList.numberOfTasks)"
		numberOfComletedTasks.text = "Completed Tasks: \(todoList.numberOfComletedTasks)"
		let progress: Float
		if todoList.numberOfTasks == 0 {
			progress = 0
		}
		else {
			progress = Float(todoList.numberOfComletedTasks)/Float(todoList.numberOfTasks)
		}
		progressLine.progress = progress
	
	}
		
}
