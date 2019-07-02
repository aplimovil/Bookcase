//
//  BookViewController_foundBarcode_method_update.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class BookViewController: UIViewController {
    
    /*************************************** Add this code ***************************************/
    
    //BoogleBooksService object to handle Google WS communication
    var booksService: BooksService = GoogleBooksService()

    /*************************************** Add this code ***************************************/
}



//Define a extension that enables BookViewController may act as Delegate for BarcodeViewController
extension BookViewController:BarcodeViewControllerDelegate {
    
    /*************************************** Update this code ***************************************/
    
    func foundBarcode(barcode:String) {
        //Connects to Google WS to get Book info from the scanned ISBN
        booksService.getBook(with: barcode) {
            (scannedBook, error) in
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
    
    /*************************************** Update this code ***************************************/
}
