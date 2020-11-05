//
//  DirectoryCollectionHeader.swift
//  TodoList
//
//  Created by Sultan alyahya on 18/03/1442 AH.
//

import UIKit

class CategoryCollectionHeader: UICollectionReusableView {
	
	@IBOutlet var createdTaskLabel: UILabel!
	@IBOutlet var completedTaskLabel: UILabel!
	
	func updateData(_ created: Int, _ Completed: Int){
		createdTaskLabel.text = "Created Tasks: \(created)"
		completedTaskLabel.text = "Completed Tasks: \(Completed)"
	}
	
}
