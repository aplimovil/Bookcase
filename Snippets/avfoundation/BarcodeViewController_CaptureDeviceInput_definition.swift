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
        
        //Define the default capture input device, in this case the camera (back)
        guard let videoInput =
            try? AVCaptureDeviceInput(device: cameraDevice)
            else {
                //Handle a possible failure if the camera can´t be initialized
                failed()
                return
        }
        
        /*********************************** Add this code ************************************/
        
    }
    
}

