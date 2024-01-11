//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import CoreData
import UIKit

class TodoListViewController: UITableViewController, UINavigationControllerDelegate {
    var todoList = [TodoItem]()
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let debouncer = Debouncer(interval: 0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadItems()
    }

    // MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = todoList[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: K.TableView.cell, for: indexPath)
        cell.textLabel?.text = cellItem.todo

        cell.textLabel?.textColor = cellItem.done ? UIColor.systemGray : UIColor.black
        cell.accessoryType = cellItem.done ? .checkmark : .none

        return cell
    }

    // MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoList[indexPath.row].done = !todoList[indexPath.row].done
        saveItems()

        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let isDone = todoList[indexPath.row].done
        return isDone ? true : false
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            guard let self = self else { return }
            self.context.delete(self.todoList[indexPath.row])
            self.todoList.remove(at: indexPath.row)
            self.saveItems()
            completion(true)
        }

        deleteAction.backgroundColor = UIColor(named: "red")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    // MARK: - Add new item

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add todo item", style: .default) { _ in
            let newTodo = TodoItem(context: self.context)
            newTodo.todo = textField.text!
            newTodo.done = false
            newTodo.parentCategory = self.selectedCategory
            self.todoList.append(newTodo)

            self.saveItems()
        }

        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new todo item"
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

    func loadItems(with request: NSFetchRequest<TodoItem> = TodoItem.fetchRequest(), predicate: NSPredicate? = nil) {
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)

        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }

        do {
            todoList = try context.fetch(request)
        } catch {
            print("Failed to fetch data: \(error)")
        }

        tableView.reloadData()
    }
}

// MARK: - Search Delegate

extension TodoListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debouncer.debounce {
            if searchBar.text?.count == 0 {
                self.loadItems()
                DispatchQueue.main.async {
                    searchBar.resignFirstResponder()
                }

                return
            }

            let request: NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
            let predicate = NSPredicate(format: "todo CONTAINS[cd] %@", searchBar.text!)

            request.sortDescriptors = [NSSortDescriptor(key: "todo", ascending: true)]
            self.loadItems(with: request, predicate: predicate)
        }
    }
}

//        var attributedText: NSMutableAttributedString
//        var attributedDoneText: NSMutableAttributedString
//        if let text = cellItem.todo {
//            // Done Text
//            attributedDoneText = NSMutableAttributedString(string: text)
//            attributedDoneText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributedDoneText.length))
//
//            // Normal Text
//            attributedText = NSMutableAttributedString(string: text)
//            attributedText.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributedText.length))
//            attributedText.removeAttribute(NSAttributedString.Key.strikethroughColor, range: NSMakeRange(0, attributedText.length))
//
//            cell.textLabel?.attributedText = cellItem.done ?attributedDoneText : attributedText
//        }
