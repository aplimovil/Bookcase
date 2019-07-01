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
    
    /*************************** Add this code ****************************/
    
    //Retrieves all books from Books database
    func retrieveBooks() -> [Book]? {
        //Opens a connection to DB
        guard let db = getOpenDB() else { return nil }
        var books:[Book] = []
        do {
            //Queries database for all books
            let rs = try db.executeQuery(
                /*As long as there is no a explicit ID field in database, SQLite creates a ROWID field
                to store an autoincrement ID for the database records*/
                "SELECT *, ROWID FROM Books", values: nil)
            //Iterates throughout the Result Set
            while rs.next() {
                //Creates a Book object from Result Set
                if let book = Book(rs: rs) {
                    //Add to Books array for updating the interface
                    books.append(book)
                }
            }
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to database
        db.close()
        return books
    }
    
    /*************************** Add this code ****************************/

}
