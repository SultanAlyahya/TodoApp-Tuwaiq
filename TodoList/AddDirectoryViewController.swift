//
//  addDirectoryViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class AddDirectoryViewController: UIViewController {
	
	var directoryListStore: DirectoryListStore!
	var updateCollection: UpdateCollectionDelegate!
	@IBOutlet var directoryTitle: UITextField!
	
	
	@IBAction func addDirectory(_ sender: UIButton) {
		
		
		self.updateCollection.addTodoList(directoryTitle.text ?? "")
		navigationController?.popViewController(animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
