//
//  BookViewController_touchSave_method_update_for_db.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class BookViewController: UIViewController {
    
    //Method to handle books save and/or update operations
    @IBAction func touchSave(_ sender: UIBarButtonItem) {
        
        /*********************************** Update this code ***********************************/
        
        //Define a Book structure with scene form data
        let bookToSave = Book(title: titleTextField.text!,
                              author: authorTextField.text!,
                              rating: 3,
                              isbn: isbnTextField.text!,
                              notes: notesTextField.text!,
                              id:book?.id,
                              cover: bookCover.image
        )
        
        /*********************************** Update this code ***********************************/
        
        //Deliver the book to the BookViewControllerDelegate object to be sent to the next scene
        delegate?.saveBook(bookToSave)
        // . . . and close the scene
        dismissMe()
    }
    
}
