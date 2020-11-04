//
//  ViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 15/03/1442 AH.
//

import UIKit

class DirectoryListViewController: UICollectionViewController {
	
	var directoryListStore: DirectoryListStore!
	var updateCollection: UpdateCollectionDelegate!
	var collectionHeader: DirectoryCollectionHeader!
	var createdTasks: Int {
		var tasks = 0
		directoryListStore.todoLists.forEach{
			todoList in
			tasks += todoList.numberOfTasks
		}
		return tasks
	}
	var completedTasks: Int {
		var tasks = 0
		directoryListStore.todoLists.forEach{
			todoList in
			tasks += todoList.numberOfComletedTasks
		}
		return tasks
	}

	
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return directoryListStore.todoLists.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoList", for: indexPath) as! DirectoryCell
		cell.uddate(directoryListStore.todoLists[indexPath.item])
		cell.layer.cornerRadius = 10
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
			case UICollectionView.elementKindSectionHeader:
				collectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "directoryView", for: indexPath) as? DirectoryCollectionHeader
				collectionHeader.updateData(createdTasks, completedTasks)
				return collectionHeader
			default:
				fatalError("Invaled Elemnet Type")
		}
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print(segue.identifier!)
		switch segue.identifier {
			case "showTodo":
				let todoListListViewController = segue.destination as! TodoViewController
				let todoList = directoryListStore.todoLists[(collectionView.indexPathsForSelectedItems?.first!.item)!]
				todoListListViewController.todoList = todoList
				todoListListViewController.updateCollection = updateCollection
			default:
				break
		}
	}
	
}

extension DirectoryListViewController: UpdateCollectionDelegate{
	func reloadCollection() {
		self.collectionView.reloadData()
	}
	
	func updateTodoList(_ todoList: TodoList) {
		if let index = directoryListStore.todoLists.firstIndex(of: todoList) {
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.reloadItems(at: [indexPath])
			collectionHeader.updateData(createdTasks, completedTasks)
		}
	}
	
	
	func deleteTodoList(_ todoList: TodoList) {
		if let index = directoryListStore.todoLists.firstIndex(of: todoList) {
			directoryListStore.todoLists.remove(at: index)
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.deleteItems(at: [indexPath])
			collectionHeader.updateData(createdTasks, completedTasks)
		}
	}
	
	
	func addTodoList(_ todoListName: String) {
		let todoList = TodoList(DirectoryName: todoListName)
		directoryListStore.addTodoList(todoList: todoList)
		if let index = directoryListStore.todoLists.firstIndex(of: todoList) {
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.insertItems(at: [indexPath])
			collectionHeader.updateData(createdTasks, completedTasks)
		}
	}
	

	
}
