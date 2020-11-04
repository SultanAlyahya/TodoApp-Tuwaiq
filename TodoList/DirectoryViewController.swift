//
//  DirectoryViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import UIKit
import UserNotifications

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
	
//	func notification(){
//		let center = UNUserNotificationCenter.current()
//
//			let content = UNMutableNotificationContent()
//			content.title = "Late wake up call"
//			content.body = "The early bird catches the worm, but the second mouse gets the cheese."
//			content.categoryIdentifier = "alarm"
//			content.userInfo = ["customData": "fizzbuzz"]
//			content.sound = UNNotificationSound.default
//
//			var dateComponents = DateComponents()
//			dateComponents.hour = 10
//			dateComponents.minute = 30
//			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//
//			let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//			center.add(request)
//	}
	
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
