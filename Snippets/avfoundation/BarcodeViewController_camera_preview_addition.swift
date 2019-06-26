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
    
    //Defines a PreviewLayer object to display the camera capture in the screen
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    /*********************************** Add this code ************************************/
    
    
    override func viewDidLoad() {
        
        /*********************************** Add this code ************************************/
        
        //Add a preview to the root view of the controller to display camera input
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.frame
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        /*********************************** Add this code ************************************/
        
    }
    
}

