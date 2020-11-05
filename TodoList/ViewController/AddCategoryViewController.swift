//
//  addDirectoryViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class AddCategoryViewController: UIViewController {
	
	var categoryStore: CategoryStore!
	var categoryStoreDelegate: CategoryStoreDelegate!
	@IBOutlet var directoryTitle: UITextField!
	
	
	@IBAction func addDirectory(_ sender: UIButton) {
		
		
		self.categoryStoreDelegate.addCategory(directoryTitle.text ?? "")
		navigationController?.popViewController(animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
