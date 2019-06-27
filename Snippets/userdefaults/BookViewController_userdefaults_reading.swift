//
//  BookViewController_infoButton_addition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/27/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {
    
    override func viewDidLoad() {
        
        /******************************* Add this code ********************************/
        
        //Makes the ISBN label and textfield visibles according to the user preference
        //stored in the UserDefaults object
        isbnTextField.isHidden = UserDefaults.standard.bool(forKey: isbnKey)
        isbnLabel.isHidden = UserDefaults.standard.bool(forKey: isbnKey)
        
        /******************************* Add this code ********************************/
        
    }
    
}

