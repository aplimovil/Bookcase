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
    
    //Removes a Book from the database
    func SQLRemoveBook(book:Book) {
        //Opens a connection to the database
        guard let db = getOpenDB() else { return  }
        do {
            //Performs an update operation on the database
            try db.executeUpdate(
                //Deletes the record from database
                "delete from Books where ROWID = ?",
                values: [book.id]
            )
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to the database
        db.close()
    }
    
    //Updates a Book in the database
    func SQLUpdateBook(book:Book) {
        guard let db = getOpenDB() else { return  }
        do {
            //Performs an update operation on the database
            try db.executeUpdate(
                //Updates the record in the database
                "update Books SET title = ?, author = ?, rating = ?, isbn = ?, notes = ? WHERE ROWID = ?", values: [book.title, book.author, book.rating, book.isbn, book.notes, book.id]
            )
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to the database
        db.close()
    }
    
    /***************************************** Add this code *****************************************/
    
    
    
    /************************************** Update this code *****************************************/
    
    //Update a book of the collection
    func updateBook(at index: Int, with book: Book) {
        //Updates the Book in the database
        SQLUpdateBook(book: book)
        //Updates the Book in the array for GUI update purposes
        books[index] = book
    }
    
    //Remove a book of the collection
    func removeBook(at index: Int) {
        //Deletes the Book in the array for GUI update purposes
        let bookToRemove = books.remove(at: index)
        //Deletes the Book in the database
        SQLRemoveBook(book: bookToRemove)
    }
    
    /************************************** Update this code *****************************************/
}

