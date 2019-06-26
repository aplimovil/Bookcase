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
        
        //Define itself as a Delegate to be able to capture the metadata from input device
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        //Start the session to turn on the input device (camera) and capture the barcode from video
        captureSession.startRunning()
        
        /*********************************** Add this code ************************************/
        
    }
    
}


/*********************************************************** Add this code ***********************************************************/

/*Defines an extension to implement the AVCaptureMetadataOutputObjectsDelegate protocol
 and handle the Barcode capture from video camera in the metadataOutput method*/
extension BarcodeViewController:
AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        //Capture the barcode
        if let metadataObject = metadataObjects.first as?
            AVMetadataMachineReadableCodeObject {
            //Stops the capture session
            captureSession.stopRunning()
            /*Extracts the string from the barcode and make the content visible
             to the navigation Delegate (previous scene - BookViewController) throghout the foundBarcode method*/
            delegate?.foundBarcode(barcode:
                metadataObject.stringValue!)
            dismiss(animated: true, completion: nil)
        }
    }
}

/*********************************************************** Add this code ***********************************************************/

