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
    //Object to hold a Book instance
    var book: Book?
    //IBOutlets for book form fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var isbnTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If Book object is not null (e.g. an update operation), fill out the form fields with Book data
        if let book = book {
            bookCover.image = book.cover
            titleTextField.text = book.title
            authorTextField.text = book.author
            isbnTextField.text = book.isbn
            notesTextField.text = book.notes
            navigationItem.title = "Edit book"
        }
        
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
        /*The property presentingViewController property will contain a value
         if the view controller was presented via a modal segue*/
        if presentingViewController != nil {
            // was presented via modal segue
            dismiss(animated: true, completion: nil)
        } else {
            // was pushed onto navigation stack
            navigationController!.popViewController(animated: true)
        }
    }
    
    //Prepare the navigation to BarcodeViewController scene
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference of BarcodeViewController from the Navigation Controller stack
        if let navigationController = segue.destination as? UINavigationController,
            let barcodeViewController = navigationController.topViewController as? BarcodeViewController {
            //Confirm the BookViewController as delegate of BarcodeViewController
            barcodeViewController.delegate = self
        }
    }
    
    
}

/*Defines a Delegate protocol for navigation purposes
 In this case, the protocol will only need one method that will pass
 a book object to the delegate ready for saving*/
protocol BookViewControllerDelegate {
    func saveBook(_ book: Book)
}

//Define a extension that enables BookViewController may act as Delegate for BarcodeViewController
extension BookViewController:BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String) {
        //When the barcode is received, the ISBN field is updated
        isbnTextField.text = barcode
    }
}

