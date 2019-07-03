//
//  GoogleBooksService_parseJSON_image_parsing.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/3/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

/******************************************* Add this code ********************************************/

import UIKit

/******************************************* Add this code ********************************************/



class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
    
    /******************************************* Add this code ********************************************/
    
    /*Downloads the image for the Book cover from the URL included in the JSON file
     using DownloadTask*/
    func loadCover(book:Book,thumbnailURL:String, completionHandler: @escaping (Book?, Error?) -> Void) {
        var book = book
        //Setup an URL for connection from thumbnail URL string
        guard let url = URL(string: thumbnailURL) else {return}
        
        /*Because an image is a larger chunk of data that makes sense to receive as a file,
         you’re going to get the book cover using a download task from the URLSession.
         Because you’ll use the default configuration, this time let’s not instantiate a URLRequest,
         and instead instantiate the task passing the URL object directly.*/
        let task = session.downloadTask(with: url) { (tempURL, response, error) in
            //Unwrap the optional URL and use it to create a Data object
            if let tempURL = tempURL,
                //Creating a data object can throw an error, so prefix this with an optional try.
                //This line extracts Data from local URL
                let data = try? Data(contentsOf: tempURL),
                //Extracts UIImage from Data (requires UIKit import)
                let image = UIImage(data: data) {
                //Updates the book object cover
                book.cover = image
            }
            completionHandler(book,error)
        }
        //Triggers task to begin
        task.resume()
    }
    
    /******************************************* Add this code ********************************************/
    
}


