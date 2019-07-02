//
//  BookViewController_getBook_method_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class BookViewController: UIViewController {
    
    /**************************************** Add this code **************************************/
    
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
    
    /**************************************** Add this code **************************************/

}
