//
//  GoogleBooksService_dataTask_definition.swift
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
        
        /*Create a URLSessionDataTask by passing in the URLRequest object to the URLSession. A completion handler
         will receive the response from the server, which contains data, response, and error optional objects.
         Because all tasks begin life by default in a suspended state, you must trigger them to start by calling
         the resume method to activate them*/
        let dataTask = session.dataTask(with: request) {
            (data, response, error) in
            //If there's an error, call the getBook method’s completion handler, passing the error object.
            if let error = error {
                completionHandler(nil, error)
            }
            //Otherwise, unwrap the data object, ready to extract book information*/
            guard let data = data else { return }
            // Get book information
        }
        dataTask.resume()
        
        /************************************ Add this code ************************************/
    }
    
}
