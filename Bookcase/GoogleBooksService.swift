//
//  GoogleBooksService.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//
import UIKit

/*Defines a generic protocol to get Book info from a Web service. It enables a more flexible design
 as long as each specific provider class (e.g. Google, Amazon ...) will implement this protocol and
 the app can change the provider when it is required*/
protocol BooksService {
    //Represents a generic method to get Book info from a WS
    func getBook(with barcode: String,
                 completionHandler: @escaping (Book?, Error?) -> Void)
    //Represents a generic method to cancel any WS operations
    func cancel()
}

//Class to handle the Google Books service use
/*Because you’ve made GoogleBooksService the delegate of the URLSession, it needs to adopt
 the URLSessionDelegate. Because the URLSession- Delegate inherits from NSObjectProtocol,
 your class also needs to adopt this protocol. The easiest way to inherit NSObjectProtocol is to subclass NSObject.*/
class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    /*The URLSesion is instantiated with a default URLSessionConfiguration object,
     sets the GoogleBooksService class as the session’s delegate, and specifies
     that session responses are sent to the main queue*/
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: OperationQueue.main)
    }()
    
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
        
        //generates a URL request from the URL
        let request = URLRequest(url: url)
        
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
            self.parseJSON(data: data, completionHandler: completionHandler)
        }
        dataTask.resume()
        
    }
    
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
                let authors = volumeInfo["authors"] as? [String],
                let imageLinks = volumeInfo["imageLinks"] as? [String:Any],
                let thumbnailURL = imageLinks["thumbnail"] as? String {
                let book = Book(title: title,
                                author: authors.joined(separator: ","),
                                rating: 0, isbn: "0", notes: "")
                loadCover(book: book,
                          thumbnailURL: thumbnailURL,
                          completionHandler: completionHandler)
                
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
    
    
    func cancel() {
    }
    
}

