//
//  BooksTableViewController.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    //BooksManager object to handle operations over the Books collection
    var booksManager:BooksManager = BooksManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //Returns the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return the number of sections
        return 1
    }
    
    //Returns the number of rows in the table section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows according to books collection size, because we have a Book per row
        return booksManager.bookCount
    }
    
    //Sets the cell look and feel and data in the table row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        /*It first checks for any cells with the requested reuse identifier in the cache, and if none are found,
         it creates a new cell. When a cell is scrolled offscreen, rather than removing the cell from memory,
         it's sent to the cache to be reused*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        /*IndexPath parameter contains the number of the section and the row of the cell it’s interested in. It then
         gets a table view cell for this index path, based on the reuse identifier you defined earlier in Interface Builder.
         The index path is generally useful here to know what data to inject into the cell*/
        let book = booksManager.getBook(at:indexPath.row)
        
        //Set the text, label an image for each according to the format design we chose for the cell
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.author
        cell.imageView?.image = book.cover
        return cell
        
    }
    
    //Handles editing functions over the cell, e.g swiping for delete operations
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the book from the array
            booksManager.removeBook(at: indexPath.row)
            //Delete the book from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Prepare the segue before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*Check that there is a value in the table view’s indexPathForSelectedRow property;
         it will happen when the user selects a row and we will use it for editing purposes*/
        if let selectedIndexPath = tableView.indexPathForSelectedRow,
            /*Unwrap a reference to the destination view controller; as you’ve created the segue directly
             to the book view controller, it will be the destination view controller*/
            let bookViewController = segue.destination
                as? BookViewController {
            
            //Editing a book
            //TableViewController pass a Book object to BookViewController
            bookViewController.book =
                booksManager.getBook(at: selectedIndexPath.row)
            /*Now you have a reference to the BookViewController, and the BooksTableViewController
             can set itself as its delegate.*/
            bookViewController.delegate = self
            
            /*Because the BookViewController is embedded in a navigation controller, the segue’s destinationViewController
             will be a navigation controller. The destinationViewController property is a UIViewController type,
             so you’ll need to downcast it to a UINavigationController.*/
        } else if let navController = segue.destination
            as? UINavigationController,
            
            /*Now that you have a reference to the navigation controller, you can get a reference to its root view
             controller. You can get a navigation controller’s root view controller with the topViewController property.
             Because this returns a UIViewController object, you’ll need to downcast it to a BookViewController.*/
            let bookViewController = navController.topViewController
                as? BookViewController {
            
            //Adding a Book
            /*Now you have a reference to the BookViewController, and the BooksTableViewController
             can set itself as its delegate.*/
            bookViewController.delegate = self
        }
        
    }
}

//Defines an extension implement the BookViewControllerDelegate protocol
extension BooksTableViewController:BookViewControllerDelegate {
    
    /*Gives an implementation to saveBook method using the addBook and updateBook BooksManager methods.
     When the navigation from BookViewController is complete it loads the Book data from
     previous scene in the Books Manager and refresh the table information*/
    func saveBook(_ book:Book) {
        /*If user has selected a row, he/she is editing a Book.
         Unwrap this index path to determine which book in the array needs updating*/
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Update book
            booksManager.updateBook(at: selectedIndexPath.row, with: book)
            //else ... user is adding a Book
        } else {
            // Add book
            booksManager.addBook(book)
        }
        tableView.reloadData()
    }
    
}

