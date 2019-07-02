//
//  GoogleBooksService_URLRequest_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
    //Gets Books information from a query to Google Books WS
    func getBook(with barcode: String,
                 completionHandler: @escaping (Book?, Error?) -> Void){
        
        /************************************ Add this code ************************************/
        
        //generates a URL request from the URL
        let request = URLRequest(url: url)
        
        /************************************ Add this code ************************************/
    }
    
}
