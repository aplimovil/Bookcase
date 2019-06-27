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
        
        //Add a Info Button inside the BookCover imageView
        let infoButton = UIButton(type: .infoLight)
        bookCover.addSubview(infoButton)
        //Defines a toogleISBN method to handle the touchUpInside event from the button
        infoButton.addTarget(self,
                             action: #selector(toggleISBN),
                             for: .touchUpInside)
        
        /******************************* Add this code ********************************/
        
    }

}
