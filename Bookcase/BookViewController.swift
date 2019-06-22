//
//  BookViewController.swift
//  Bookcase
//
//  Created by Craig Grummitt on 10/05/2016.
//  Copyright © 2016 Craig Grummitt. All rights reserved.
//
import UIKit

class BookViewController: UIViewController {
    
    //Object to hold a BookViewControllerDelegate instance
    var delegate: BookViewControllerDelegate?
    //IBOutlets for book form fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var bookCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Method to handle books save and/or update operations
    @IBAction func touchSave(_ sender: UIBarButtonItem) {
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
    }
    
    //Method to handle the addition and/or book update cancel operation
    @IBAction func touchCancel(_ sender: UIBarButtonItem) {
        //For now, it calls the dismiss method to close the scene
        dismissMe()
    }
    
    //Method to dismiss the current scene
    func dismissMe() {
        dismiss(animated: true, completion: nil)
    }
    
    
}

/*Defines a Delegate protocol for navigation purposes
 In this case, the protocol will only need one method that will pass
 a book object to the delegate ready for saving*/
protocol BookViewControllerDelegate {
    func saveBook(_ book: Book)
}

