//
//  Todo.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation
import UserNotifications

class Todo: Equatable, Codable {
	static func == (lhs: Todo, rhs: Todo) -> Bool {
		return lhs.dateCreated == rhs.dateCreated
	}
	
	var title: String
	var description: String
	var date: Date
	var isCompleted = false
	var dateCreated = Date()
	var needNotification = false
	private var notificationID = UUID().uuidString
	var firstTitleChar: Character{
		let firstChar: String
		if title.isEmpty{
			firstChar = "z"
		} else {
			firstChar = String(title.prefix(1))
		}
		return Character(firstChar.lowercased())
	}
	
	init (title: String, description: String, date: Date){
		self.title = title
		self.description = description
		self.date = date
	}
	
		func toggleNotification(){
			
			let center = UNUserNotificationCenter.current()
			if needNotification {
				center.removePendingNotificationRequests(withIdentifiers: [notificationID])
				needNotification = false
			}
			else {
				let content = UNMutableNotificationContent()
				content.title = title
				content.body = "the due date for this Todo has been approaches"
				content.categoryIdentifier = "alarm"
				content.sound = UNNotificationSound.default
		
				let dateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date)
				
				let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
		
				let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
				center.add(request)
				needNotification = true
			}
			
		}
	
}
//init (title: String, description: String, date: Date){
//	self.title = title
//	self.description = description
//	self.date = date
//	let calender = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date)
//	print(calender.day!)
//	print(calender.hour!)
//	print(calender.minute!)
//	print(calender.second!)
//}

//	func generateNotification(){
//		let content = UNMutableNotificationContent()
//		content.title = title
//		content.body = "the due date for this Todo has been approaches"
//		content.categoryIdentifier = "alarm"
//		content.sound = UNNotificationSound.default
//
//		var dateComponents = DateComponents()
//		let calender = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date)
//		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//
//		let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//		center.add(request)
//	}
