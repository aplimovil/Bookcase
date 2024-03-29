//
//  Book.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import UIKit

//Internal struct for FMDB database handling
internal struct Key {
    static let title = "title"
    static let author = "author"
    static let rating = "rating"
    static let isbn = "isbn"
    static let notes = "notes"
}

struct Book {
    //Defines the properties for each Book in the collection
    static let defaultCover = UIImage(named: "book.jpg")!
    var title:String
    var author:String
    var rating:Double
    var isbn:String
    var notes:String
    //Id from database
    var id:Int
    //Use a default cover if none is set
    var cover:UIImage {
        get {
            return image ?? Book.defaultCover
        }
        set {
            image = newValue
        }
    }
    private var image:UIImage? = nil
    
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
}
