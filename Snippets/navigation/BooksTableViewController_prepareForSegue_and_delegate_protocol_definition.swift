//
//  BooksTableViewController_prepareForSegue_and_delegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BooksTableViewController: UITableViewController {
    
    /************************************************ Add this code ****************************************************/
    
    // Prepare the segue before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*Because the BookViewController is embedded in a navigation controller, the segue’s destinationViewController
         will be a navigation controller. The destinationViewController property is a UIViewController type,
         so you’ll need to downcast it to a UINavigationController.*/
        if let navController = segue.destination as? UINavigationController {
            
            /*Now that you have a reference to the navigation controller, you can get a reference to its root view
             controller. You can get a navigation controller’s root view controller with the topViewController property.
             Because this returns a UIViewController object, you’ll need to downcast it to a BookViewController.*/
            if let bookViewController = navController.topViewController as? BookViewController {
                
                /*Now you have a reference to the BookViewController, and the BooksTableViewController
                 can set itself as its delegate.*/
                bookViewController.delegate = self
            }
        }
    }
    
    /************************************************ Add this code ****************************************************/
}


/************************************************ Add this code ****************************************************/

//Defines an extension implement the BookViewControllerDelegate protocol
extension BooksTableViewController:BookViewControllerDelegate {
    
    /*Gives an implementation to saveBook method using the addBook BooksManager method
     When the navigation from BookViewController is complete it loads the Book data from
     previous scene in the Books Manager and refresh the table information*/
    func saveBook(_ book:Book) {
        booksManager.addBook(book)
        tableView.reloadData()
    }
}

/************************************************ Add this code ****************************************************/
