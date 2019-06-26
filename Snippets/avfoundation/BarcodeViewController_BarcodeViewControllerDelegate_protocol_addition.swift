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
    
    //Object to store a BarcodeViewControllerDelegate instance
    var delegate:BarcodeViewControllerDelegate?
    
    /************************** Add this code *******************************/
    
}

/************************** Add this code *******************************/

//Delegate protocol implementation for barcode readings notification
protocol BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String)
}

/************************** Add this code *******************************/
