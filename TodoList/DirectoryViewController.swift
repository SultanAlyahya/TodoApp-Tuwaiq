//
//  DirectoryViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit

class DirectoryViewCntroller: UIViewController {
	
	
	@IBOutlet var addButton: UIButton!
	var directoryListStore: DirectoryListStore!
	var todoList: TodoList!
	var updateCollection: UpdateCollectionDelegate!
	@IBOutlet var spinner: UIActivityIndicatorView!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "mbDirectoryList":
				let directoryListViewController = segue.destination as! DirectoryListViewController
				updateCollection = directoryListViewController
				directoryListViewController.updateCollection = updateCollection
				directoryListViewController.directoryListStore = directoryListStore
				//todoList = directoryListViewController.todoList
			case "showTodo":
				// the preparation in the TodoListViewController
				break
			case "showAddDirectory":
				let addDirectoryViewController = segue.destination as! AddDirectoryViewController
				addDirectoryViewController.directoryListStore = directoryListStore
				addDirectoryViewController.updateCollection = updateCollection
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
			self.updateCollection.reloadCollection()
			self.spinner.stopAnimating()
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
