//
//  GoogleBooksService_dataTask_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
    /************************************ Add this code ************************************/
    
    //Parses Google Books WS response in JSON format.
    //Function receives Data object and completion handler
    private func parseJSON(data: Data,
                           completionHandler:
        @escaping (Book?, Error?) -> Void) {
        do {
            if let dataAsJSON =
                //Parses data as JSON to Foundation data types
                try JSONSerialization.jsonObject(
                    with: data,
                    options: [])
                    //Downcasts to Dictionary
                    as? [String: Any] {
                // -------> Traverse hierarchy
                
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
    
    /************************************ Add this code ************************************/
    
}
