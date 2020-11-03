//
//  ViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 15/03/1442 AH.
//

import UIKit

class DirectoryListViewController: UICollectionViewController {
	
	var directoryListStore: DirectoryListStore!
	
	
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return directoryListStore.todoLists.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoList", for: indexPath) as! DirectoryCell
		cell.uddate(directoryListStore.todoLists[indexPath.item])
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
			case UICollectionView.elementKindSectionHeader:
				let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "directoryView", for: indexPath)
				return header
			default:
				fatalError("Invaled Elemnet Type")
		}
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print(segue.identifier)
		switch segue.identifier {
			case "showTodo":
				let todoListListViewController = segue.destination as! TodoViewController
				let todoList = directoryListStore.todoLists[(collectionView.indexPathsForSelectedItems?.first!.item)!]
				todoListListViewController.todoList = todoList
			default:
				break
		}
	}
}

extension DirectoryListViewController: UpdateCollectionDelegate{
	func addTodoList(_ todoListName: String) {
		let todoList = TodoList(DirectoryName: todoListName)
		directoryListStore.addTodoList(todoList: todoList)
		if let index = directoryListStore.todoLists.firstIndex(of: todoList) {
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.insertItems(at: [indexPath])		}
	}
	

	
}
