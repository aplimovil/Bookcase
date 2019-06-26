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
        
        //Connect the video camera input to capture session
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
            //Shows an error message if connection was not successful
        } else {failed();return}
        
        /*********************************** Add this code ************************************/
        
    }
    
}

