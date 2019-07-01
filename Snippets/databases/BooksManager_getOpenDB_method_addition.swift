//
//  BooksManager_getOpenDB_method_addition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation


//Class to handle operations over the books collection
class BooksManager {
    
    /********************************* Add this code ***********************************/
    
    //Uses the FMDB wrapper to get a reference to the Books database on the specific path
    func getOpenDB()->FMDatabase? {
        let db = FMDatabase(path: booksFile.path)
        guard db.open() else {
            print("Unable to open database")
            return nil
        }
        return db
    }
    
    /********************************* Add this code ***********************************/
    
}
