//
//  DirectoryViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit
import UserNotifications

class CategoryViewCntroller: UIViewController {
	
	
	@IBOutlet var addButton: UIButton!
	var categoryStore: CategoryStore!
	var todoList: Category!
	var categoryStoreDelegate: CategoryStoreDelegate!
	@IBOutlet var spinner: UIActivityIndicatorView!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "mbCategoryList":
				let directoryListViewController = segue.destination as! CategoryListViewController
				categoryStoreDelegate = directoryListViewController
				directoryListViewController.categoryStoreDelegate = categoryStoreDelegate
				directoryListViewController.categoryStore = categoryStore
			case "showTodo":
				// the preparation in the TodoListViewController
				break
			case "showAddCategory":
				let addDirectoryViewController = segue.destination as! AddDirectoryViewController
				addDirectoryViewController.categoryStore = categoryStore
				addDirectoryViewController.categoryStoreDelegate = categoryStoreDelegate
			default:
				print(segue.identifier!)
				fatalError("InvalidSegue")
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let notificatioCenter = NotificationCenter.default
		notificatioCenter.addObserver(self,
									  selector: #selector(reloadCollection(_:)),
									  name: Notification.Name(rawValue: "directoryLoaded"),
									  object: nil)
		
		
  }
	
	@objc func reloadCollection(_ notification: Notification){
		OperationQueue.main.addOperation {
			self.spinner.stopAnimating()
			self.categoryStoreDelegate.reloadCategoryStore()
		}
	}
}


@IBDesignable extension UIButton {
	@IBInspectable var cornerRaduis: CGFloat {
		set {
			layer.cornerRadius = newValue
		}
		get {
			return layer.cornerRadius
		}
	}
}
