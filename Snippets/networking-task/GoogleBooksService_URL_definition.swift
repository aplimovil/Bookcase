//
//  GoogleBooksService_URL_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation


class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
    /************************************ Add this code ************************************/
    
    // Google WS URL
    let googleUrl = "https://www.googleapis.com/books/v1/volumes"
    
    //Gets Books information from a query to Google Books WS
    func getBook(with barcode: String,
                 completionHandler: @escaping (Book?, Error?) -> Void){
        //Creates an URLComponents object from URL String
        var components = URLComponents(string: googleUrl)!
        /*Sets URL components query items according to WS API specification; in this case
         we complete the "q" parameter with the ISBN captured from barcode*/
        components.queryItems = [
            URLQueryItem(name: "q", value: barcode)]
        //Gets the URL string and prints it
        guard let url = components.url else {return}
        print(url.query!) // q=9781617294075 for example
    }
    
    /************************************ Add this code ************************************/

}


