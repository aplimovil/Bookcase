//
//  GoogleBooksService.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

/*********************************************** Update this code **************************************************/
//Class to handle the Google Books service use
/*Because you’ve made GoogleBooksService the delegate of the URLSession, it needs to adopt
 the URLSessionDelegate. Because the URLSession- Delegate inherits from NSObjectProtocol,
 your class also needs to adopt this protocol. The easiest way to inherit NSObjectProtocol is to subclass NSObject.*/
class GoogleBooksService: NSObject, BooksService, URLSessionDelegate {
    
/*********************************************** Update this code **************************************************/
    
    
    
    /*********************************************** Add this code **************************************************/
    
    /*The URLSesion is instantiated with a default URLSessionConfiguration object,
     sets the GoogleBooksService class as the session’s delegate, and specifies
     that session responses are sent to the main queue*/
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: OperationQueue.main)
    }()
    
    /*********************************************** Add this code **************************************************/
}


