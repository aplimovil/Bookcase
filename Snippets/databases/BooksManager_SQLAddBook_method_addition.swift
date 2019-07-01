//
//  BooksManager_retrieveBooks_method_addition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

//Class to handle operations over the books collection
class BooksManager {
    
    /***************************************** Add this code *****************************************/
    
    //Adds a Book to the database
    /*All parameters passed into a Swift function are constants, so you can’t change them.
     You can pass in one or more parameters as inout, which means they can be changed inside your function,
     and those changes reflect in the original value outside the function
     In this case, by using the Book parameter as inout enables you to update the Id field of the Book object
     with the value read from the database*/
    func SQLAddBook(book:inout Book) {
        //Opens a connection to the database
        guard let db = getOpenDB() else { return  }
        do {
            //Performs an update operation on the database
            try db.executeUpdate(
                //Add a Book record
                "insert into Books (title, author, rating, isbn, notes) values (?, ?, ?, ?, ?)",
                values: [book.title, book.author, book.rating, book.isbn, book.notes]
            )
            //Gets the ROWID and updates the Id field of the book object
            book.id = Int(db.lastInsertRowId)
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to the database
        db.close()
    }
    
    /***************************************** Add this code *****************************************/
    
    
    
    /************************************** Update this code *****************************************/
    
    //Add a book to the collection
    func addBook(_ book:Book) {
        /*As the book object is updated with the ID, you’ll need to mark the argument with an ampersand
         to make this parameter mutable, so you’ll need to reassign it as a variable*/
        var book = book
        //Adds the record in the database
        SQLAddBook(book: &book)
        //Updates the array with GUI update purposes
        books.append(book)
    }
    
    /************************************** Update this code *****************************************/
}
