//
//  BookViewController_delegate_handling_barcode_notification.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/25/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import UIKit


class BookViewController: UIViewController {
    
    /****************************************** Add this code *********************************************/
    
    //Prepare the navigation to BarcodeViewController scene
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference of BarcodeViewController from the Navigation Controller stack
        if let navigationController = segue.destination as? UINavigationController,
            let barcodeViewController = navigationController.topViewController as? BarcodeViewController {
            //Confirm the BookViewController as delegate of BarcodeViewController
            barcodeViewController.delegate = self
        }
    }
    
    /****************************************** Add this code *********************************************/

}

/****************************************** Add this code *********************************************/

//Define a extension that enables BookViewController may act as Delegate for BarcodeViewController
extension BookViewController:BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String) {
        //When the barcode is received, the ISBN field is updated
        isbnTextField.text = barcode
    }
}

/****************************************** Add this code *********************************************/
