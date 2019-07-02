//
//  GoogleBooksService_dataTask_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
    
    func getBook(with barcode: String,
                 completionHandler: @escaping (Book?, Error?) -> Void){
        
        let dataTask = session.dataTask(with: request) {
            (data, response, error) in
            //If there's an error, call the getBook method’s completion handler, passing the error object.
            if let error = error {
                completionHandler(nil, error)
            }
            //Otherwise, unwrap the data object, ready to extract book information*/
            guard let data = data else { return }
            
            /************************************ Update this code ************************************/
            
            // Get book information
            self.parseJSON(data: data, completionHandler: completionHandler)
            
            /************************************ Update this code ************************************/
        }
        dataTask.resume()
    }
    
    
    private func parseJSON(data: Data,
                           completionHandler:
        @escaping (Book?, Error?) -> Void) {
        do {
            
            /************************************ Update this code ************************************/
            
            if let dataAsJSON =
                //Parses data as JSON to Foundation data types
                try JSONSerialization.jsonObject(
                    with: data,
                    options: [])
                    //Downcasts to Dictionary
                    as? [String: Any],
                // -------> Traverse hierarchy
                let items = dataAsJSON["items"] as? [Any],
                let volume = items[0] as? [String:Any],
                let volumeInfo = volume["volumeInfo"] as? [String:Any],
                let title = volumeInfo["title"] as? String,
                let authors = volumeInfo["authors"] as? [String] {
                let book = Book(title: title,
                                author: authors.joined(separator: ","),
                                rating: 0, isbn: "0", notes: "")
                completionHandler(book,nil)
                
                /************************************ Update this code ************************************/
                
                //If downcast unsuccessful
            } else {
                completionHandler(nil, nil)
            }
            //If error thrown in parsing
        } catch let error as NSError {
            completionHandler(nil, error)
            return
        }
    }
    
}
