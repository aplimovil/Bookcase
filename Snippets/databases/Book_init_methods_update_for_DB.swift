//
//  Book_init_methods_update_for_DB.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

struct Book {
    
    /******************************************* Update this code **********************************************/
    
    //Update initializer for including id field from Books database
    init(title:String,author:String,rating:Double,isbn:String,notes:String,id:Int? = nil,cover:UIImage? = nil) {
        self.title = title
        self.author = author
        self.rating = rating
        self.isbn = isbn
        self.notes = notes
        self.id = id ?? -1
        self.image = cover
    }
    
    /******************************************* Update this code **********************************************/
    
    
    /********************************************* Add this code ***********************************************/
    
    //Initializer for getting a new Book instance from a FMDB ResultSet object
    init?(rs:FMResultSet) {
        let rating = rs.double(forColumn: Key.rating)
        let id = rs.int(forColumn: "ROWID")
        guard let title = rs.string(forColumn: Key.title),
            let author = rs.string(forColumn: Key.author),
            let isbn = rs.string(forColumn: Key.isbn),
            let notes = rs.string(forColumn: Key.notes)
            else { return nil }
        self.init(title:title,
                  author:author,
                  rating:rating,
                  isbn:isbn,
                  notes:notes,
                  id:Int(id)
        )
    }
    
    /********************************************* Add this code ***********************************************/

}
