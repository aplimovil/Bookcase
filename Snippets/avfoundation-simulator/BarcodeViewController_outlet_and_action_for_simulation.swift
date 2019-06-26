//
//  BarcodeViewController_AVCaptureSession_setup.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/26/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation


class BarcodeViewController: UIViewController {
    
    /*********************************** Add this code ************************************/
    
    //Outlet of barcode Textfield for simulation purposes
    @IBOutlet weak var barcodeTextField: UITextField!
    
    /*********************************** Add this code ************************************/
    
    
    
    
    /*********************************** Add this code ************************************/
    
    @IBAction func touchBarcode(_ sender: UIButton) {
        //Sets the barcode textfield content on the navigation Delegate for simulation purposes
        delegate?.foundBarcode(barcode: barcodeTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    /*********************************** Add this code ************************************/
    
}


