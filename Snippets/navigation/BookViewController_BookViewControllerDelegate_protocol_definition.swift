//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {
    
    /************************************ Add this code **********************************/
    
    //Object to hold a BookViewControllerDelegate instance
    var delegate: BookViewControllerDelegate?
    
    /************************************ Add this code **********************************/
    
}

/************************************ Add this code **********************************/

/*Defines a Delegate protocol for navigation purposes
 In this case, the protocol will only need one method that will pass
 a book object to the delegate ready for saving*/
protocol BookViewControllerDelegate {
    func saveBook(_ book: Book)
}

/************************************ Add this code **********************************/


