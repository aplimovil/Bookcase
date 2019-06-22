//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {
    
    /************************************ Add this code **********************************/
    
    //IBOutlets for book form fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var bookCover: UIImageView!
    
    /************************************ Add this code **********************************/
    
    
    
    //Method to handle books save and/or update operations
    @IBAction func touchSave(_ sender: UIBarButtonItem) {
        
        /************************************ Update this code **********************************/
        
        //Define a Book structure with scene form data
        let bookToSave = Book(title: titleTextField.text!,
                              author: authorTextField.text!,
                              rating: 3,
                              isbn: "",
                              notes: notesTextField.text!,
                              cover: bookCover.image
        )
        //Deliver the book to the BookViewControllerDelegate object to be sent to the next scene
        delegate?.saveBook(bookToSave)
        // . . . and close the scene
        dismissMe()
        
        /************************************ Update this code **********************************/
    }
    
}
