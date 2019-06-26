//
//  BarcodeViewController_touchCancel_method_addition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/25/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

class BarcodeViewController: UIViewController {
    
    /************************** Add this code *******************************/
    
    @IBAction func touchCancel(_ sender: UIBarButtonItem) {
        //Dissmiss the current scene if user cancels the barcode detection
        dismiss(animated: true, completion: nil)
    }
    
    /************************** Add this code *******************************/

}
