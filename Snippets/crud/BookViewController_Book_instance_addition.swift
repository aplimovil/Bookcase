//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {
    
    /************************************ Add this code **********************************/
    
    //Object to hold a Book instance
    var book: Book?
    
    /************************************ Add this code **********************************/
    
}

override func viewDidLoad() {
    
    /************************************ Add this code **********************************/
    
    //If Book object is not null (e.g. an update operation), fill out the form fields with Book data
    if let book = book {
        bookCover.image = book.cover
        titleTextField.text = book.title
        authorTextField.text = book.author
        isbnTextField.text = book.isbn
        notesTextField.text = book.notes
        navigationItem.title = "Edit book"
    }
    
    /************************************ Add this code **********************************/
    
}




