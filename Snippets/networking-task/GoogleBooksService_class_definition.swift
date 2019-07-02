//
//  GoogleBooksService.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

/******************************************* Add this code ****************************************/

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
class GoogleBooksService: BooksService {
    //Represents a generic method to get Book info from a WS
    func getBook(with barcode: String,
                 completionHandler: @escaping (Book?, Error?) -> Void){
        
    }
    //Represents a generic method to cancel any WS operations
    func cancel(){
        
    }
}

/******************************************* Add this code ****************************************/


