//
//  ViewController.swift
//  TodoList
//
//  Created by Sultan alyahya on 15/03/1442 AH.
//

import UIKit

class CategoryListViewController: UICollectionViewController {
	
	var categoryStore: CategoryStore!
	var categoryStoreDelegate: CategoryStoreDelegate!
	var collectionHeader: DirectoryCollectionHeader!
	var createdTasks: Int {
		var tasks = 0
		categoryStore.categories.forEach{
			category in
			tasks += category.numberOfTasks
		}
		return tasks
	}
	var completedTasks: Int {
		var tasks = 0
		categoryStore.categories.forEach{
			category in
			tasks += category.numberOfComletedTasks
		}
		return tasks
	}

	
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categoryStore.categories.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoList", for: indexPath) as! DirectoryCell
		cell.uddate(categoryStore.categories[indexPath.item])
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
				let todoList = categoryStore.categories[(collectionView.indexPathsForSelectedItems?.first!.item)!]
				todoListListViewController.catagory = todoList
				todoListListViewController.categoryStoreDelegate = categoryStoreDelegate
			default:
				break
		}
	}
	
}

extension CategoryListViewController: CategoryStoreDelegate{
	func reloadCategoryStore() {
		self.collectionView.reloadData()
	}
	
	func updateCategory(_ category: Category) {
		if let index = categoryStore.categories.firstIndex(of: category) {
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.reloadItems(at: [indexPath])
			collectionHeader.updateData(createdTasks, completedTasks)
		}
	}
	
	
	func deleteCategory(_ category: Category) {
		if let index = categoryStore.categories.firstIndex(of: category) {
			categoryStore.categories.remove(at: index)
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.deleteItems(at: [indexPath])
			collectionHeader.updateData(createdTasks, completedTasks)
		}
	}
	
	
	func addCategory(_ categoryName: String) {
		let todoList = Category(DirectoryName: categoryName)
		categoryStore.addTodoList(todoList: todoList)
		if let index = categoryStore.categories.firstIndex(of: todoList) {
			let indexPath = IndexPath(item: index, section: 0)
			collectionView.insertItems(at: [indexPath])
			collectionHeader.updateData(createdTasks, completedTasks)
		}
	}
	

	
}
