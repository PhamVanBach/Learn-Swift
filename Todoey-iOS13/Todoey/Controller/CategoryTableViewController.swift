//
//  CategoryViewControllerTableViewController.swift
//  Todoey
//
//  Created by Bach Pham on 17/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import CoreData
import UIKit

class CategoryTableViewController: UITableViewController {
    var categoryList = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = categoryList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TableView.cateCell, for: indexPath)

        cell.textLabel?.text = cellItem.name

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.todoListSegue, sender: self)
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            guard let self = self else { return }
            self.context.delete(self.categoryList[indexPath.row])
            self.categoryList.remove(at: indexPath.row)
            self.saveItems()
            completion(true)
        }

        deleteAction.backgroundColor = UIColor(named: "red")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryList[indexPath.row]
        }
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add new category item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add categoy item", style: .default) { _ in
            let newCate = Category(context: self.context)
            newCate.name = textField.text!

            self.categoryList.append(newCate)
            self.saveItems()
        }

        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new category  item"
            textField = alertTextField
        }

        present(alert, animated: true, completion: nil)
    }

    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
        tableView.reloadData()
    }

    func loadItems() {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()

        do {
            categoryList = try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch data: \(error)")
        }
        tableView.reloadData()
    }
}
