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
    //Key name for storing the ISBN visibility user preference
    private let isbnKey = "ISBN"
    //BoogleBooksService object to handle Google WS communication
    var booksService: BooksService = GoogleBooksService()
    //IBOutlets for book form fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var isbnTextField: UITextField!
    @IBOutlet weak var isbnLabel: UILabel!
    
    
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
        //Add a Info Button inside the BookCover imageView
        let infoButton = UIButton(type: .infoLight)
        bookCover.addSubview(infoButton)
        //Defines a toogleISBN method to handle the touchUpInside event from the button
        infoButton.addTarget(self,
                             action: #selector(toggleISBN),
                             for: .touchUpInside)
        //Makes the ISBN label and textfield visibles according to the user preference
        //stored in the UserDefaults object
        isbnTextField.isHidden = UserDefaults.standard.bool(forKey: isbnKey)
        isbnLabel.isHidden = UserDefaults.standard.bool(forKey: isbnKey)
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
                              isbn: isbnTextField.text!,
                              notes: notesTextField.text!,
                              id:book?.id,
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
    
    //Method to handle the infoButton event to store the user preference about
    //to make the ISBN field visible
    @objc func toggleISBN() {
        UIView.animate(withDuration: 0.5, animations: {
            //Makes the ISBN label and textfield visible or hidden when user touches the button
            self.isbnTextField.isHidden = !self.isbnTextField.isHidden
            self.isbnLabel.isHidden = !self.isbnLabel.isHidden
        })
        //Saves the ISBN visibility preference in the UserDefaults object using the key defined
        //in the variables declaration
        UserDefaults.standard.set(isbnTextField.isHidden, forKey: isbnKey)
    }
    
    //Connects to Google Books WS to get Book Info from a scanned ISBN
    /*The closure including the completionHandler will notify to BookViewController when service
     invocation has finished. As long as it will be called from an asynchronous operation,
     it needs to be defined as @escaping*/
    func getBook(with barcode: String,
                 completionHandler: @escaping (Book?, Error?) -> Void) {
        // Get book from web service
    }
    
    //Cancels WS communication operations
    func cancel() {
        // Cancel any web service operations
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
        
        /*Gets a reference to the UIApplication with its singleton type property shared
         and turn on the activity indicator*/
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        //Connects to Google WS to get Book info from the scanned ISBN
        booksService.getBook(with: barcode) {
            (scannedBook, error) in
            
            //Hides the indicator by setting the isNetworkActivityIndicatorVisible property to false
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if error != nil {
                // Deal with error here
                return
                //Fill the form fields with the Book data recovered from WS
            } else if let scannedBook = scannedBook {
                self.titleTextField.text = scannedBook.title
                self.authorTextField.text = scannedBook.author
                self.bookCover.image = scannedBook.cover
                self.isbnTextField.text = barcode
            }else {
                // Deal with no error, no book!
            }
        }
    }
}

