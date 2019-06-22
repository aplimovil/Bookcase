//
//  ViewController_navigation_methods_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class ViewController: UIViewController {

    /******************************** Update this code ********************************/
    
    //Method to handle books save and/or update operations
    @IBAction func touchSave(_ sender: UIBarButtonItem) {
        //For now, it calls the dismiss method to close the scene
        dismissMe()
    }
    
    //Method to handle the addition and/or book update cancel operation
    @IBAction func touchCancel(_ sender: UIBarButtonItem) {
        //For now, it calls the dismiss method to close the scene
        dismissMe()
    }
    
    /******************************** Update this code ********************************/
    
    /********************************* Add this code **********************************/
    
    //Method to dismiss the current scene
    func dismissMe() {
        dismiss(animated: true, completion: nil)
    }
    
    /********************************* Add this code **********************************/
    
}
