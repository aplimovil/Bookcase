//
//  BookViewController_network_activity_indicator_setup.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/3/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {

}

//Define a extension that enables BookViewController may act as Delegate for BarcodeViewController
extension BookViewController:BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String) {
        
        /************************************ Add this code ****************************************/
        
        /*Gets a reference to the UIApplication with its singleton type property shared
         and turn on the activity indicator*/
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        /************************************ Add this code ****************************************/
        
        
        //Connects to Google WS to get Book info from the scanned ISBN
        booksService.getBook(with: barcode) {
            (scannedBook, error) in
            
            
            /************************************ Add this code ****************************************/
            
            //Hides the indicator by setting the isNetworkActivityIndicatorVisible property to false
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            /************************************ Add this code ****************************************/
            
            
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
