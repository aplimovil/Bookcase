//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BooksManager {
    
    /************************************ Add this code **********************************/
    
    //Update a book of the collection
    func updateBook(at index: Int, with book: Book) {
        books[index] = book
    }
    
    /************************************ Add this code **********************************/
    
}



extension BooksTableViewController:BookViewControllerDelegate {
    
    /************************************ Update this code **********************************/
    
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
    
    /************************************ Update this code **********************************/
    
}





