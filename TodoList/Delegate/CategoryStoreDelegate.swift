//
//  UpdateCollectionDelegate.swift
//  TodoList
//
//  Created by Sultan alyahya on 16/03/1442 AH.
//

import Foundation

protocol CategoryStoreDelegate {
	func addCategory(_ categoryName: String)
	func deleteCategory(_ category: Category)
	func updateCategory(_ category: Category)
	func reloadCategoryStore()
}
