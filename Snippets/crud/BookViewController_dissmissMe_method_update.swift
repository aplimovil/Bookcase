//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {
    
    /************************************ Update this code **********************************/
    
    //Method to dismiss the current scene
    func dismissMe() {
        /*The property presentingViewController property will contain a value
         if the view controller was presented via a modal segue*/
        if presentingViewController != nil {
            // was presented via modal segue
            dismiss(animated: true, completion: nil)
        } else {
            // was pushed onto navigation stack
            navigationController!.popViewController(animated: true)
        }
    }
    
    /************************************ Update this code **********************************/
    
}





