//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Christian Sailer on 25.06.19.
//  Copyright © 2019 Christian Sailer. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        tableView.reloadData()
//        loadCategory()

    }
    
    // Mark - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
//
//        cell.textLabel?.text = categories[indexPath.row].name
//
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7 //categories.count
    }
    
  
    // Mark - Data Manipulation Methods
    
    func loadCategory() {
        
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading message: \(error)")
        }
        print(categories)
        tableView.reloadData()
    }
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving message: \(error)")
        }
        tableView.reloadData()
    }
    
    // Mark - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            
            
            let newCategory = Category(context: self.context)
            
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            self.saveCategories()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    // Mark - TableView Delegate Methods
    

    
}
