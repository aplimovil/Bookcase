//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BooksTableViewController: UIViewController {
    
    /************************************ Update this code **********************************/
    
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
    
    /************************************ Update this code **********************************/
    
}




