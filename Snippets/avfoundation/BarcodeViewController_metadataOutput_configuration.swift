//
//  BarcodeViewController_AVCaptureSession_setup.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/26/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation


class BarcodeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        /*********************************** Add this code ************************************/
        
        //Bar code detector
        /*Defines the output as metadata extracted from the input device,
         in this case the barcode content from the video captured by camera*/
        let metadataOutput = AVCaptureMetadataOutput()
        //Connect the output to capture session
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            //Shows an error message if connection was not successful
        } else {failed();return}
        // Customize metadata output (EAN13 support for ISBN barcode); other media formats as QR may be configured
        metadataOutput.metadataObjectTypes =
            [AVMetadataObject.ObjectType.ean13]
        
        /*********************************** Add this code ************************************/
        
    }
    
}
