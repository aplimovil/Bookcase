//
//  GoogleBooksService_parseJSON_image_parsing.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/3/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
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
                    as? [String: Any],
                // -------> Traverse hierarchy
                let items = dataAsJSON["items"] as? [Any],
                let volume = items[0] as? [String:Any],
                let volumeInfo = volume["volumeInfo"] as? [String:Any],
                let title = volumeInfo["title"] as? String,
                
                /************************ Update this code ***************************/
                
                let authors = volumeInfo["authors"] as? [String],
                let imageLinks = volumeInfo["imageLinks"] as? [String:Any],
                let thumbnailURL = imageLinks["thumbnail"] as? String {
                
                /************************ Update this code ***************************/
                
                
                let book = Book(title: title,
                                author: authors.joined(separator: ","),
                                rating: 0, isbn: "0", notes: "")
                completionHandler(book,nil)
                
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
