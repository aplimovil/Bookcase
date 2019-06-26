//
//  BarcodeViewController_AVCaptureSession_setup.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/26/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation


class BarcodeViewController: UIViewController {
    
    func failed() {
        //Shows an Alert if there was an error during the camera setup for capture purposes
        let ac = UIAlertController(title: "Barcode detection not supported",
                                   message: "Your device doesn't support barcode detection.",
                                   preferredStyle: .alert)
        let alert = UIAlertAction(title: "OK", style: .default)
        
        /************************ Update this code ***************************/
        
        /*
         { (action) in
         self.dismiss(animated: true, completion: nil)
         }*/
        
        /************************ Update this code ***************************/
        ac.addAction(alert)
        present(ac, animated: true, completion: nil)
    }
    
    
    
    
}


