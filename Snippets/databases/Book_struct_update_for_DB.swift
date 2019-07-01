//
//  Book_struct_update_for_DB.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

/******************************** Add this code *****************************/

//Internal struct for FMDB database handling
internal struct Key {
    static let title = "title"
    static let author = "author"
    static let rating = "rating"
    static let isbn = "isbn"
    static let notes = "notes"
}

/******************************** Add this code *****************************/

struct Book {
    
    /******************************** Add this code *****************************/
    
    //Id from database
    var id:Int
    
    /******************************** Add this code *****************************/
}
