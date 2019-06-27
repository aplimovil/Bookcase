//
//  BookViewController_infoButton_addition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/27/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BookViewController: UIViewController {
    
    /******************************* Add this code ********************************/
    
    private let isbnKey = "ISBN"
    @IBOutlet weak var isbnLabel: UILabel!
    
    /******************************* Add this code ********************************/
    
    
    
    /******************************* Add this code ********************************/
    
    //Method to handle the infoButton event to store the user preference about
    //to make the ISBN field visible
    @objc func toggleISBN() {
        UIView.animate(withDuration: 0.5, animations: {
            //Makes the ISBN label and textfield visible or hidden when user touches the button
            self.isbnTextField.isHidden = !self.isbnTextField.isHidden
            self.isbnLabel.isHidden = !self.isbnLabel.isHidden
        })
        //Saves the ISBN visibility preference in the UserDefaults object using the key defined
        //in the variables declaration
        UserDefaults.standard.set(isbnTextField.isHidden, forKey: isbnKey)
    }
    
    /******************************* Add this code ********************************/
    
}

