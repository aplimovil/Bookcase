//
//  BarcodeViewController_AVCaptureSession_setup.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/26/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

/*********************************** Add this code ************************************/

import AVFoundation

/*********************************** Add this code ************************************/


class BarcodeViewController: UIViewController {
    
    /*********************************** Add this code ************************************/
    
    //Define a captureSession object to handle the camera capture process
    var captureSession: AVCaptureSession = AVCaptureSession()
    
    /*********************************** Add this code ************************************/
    
    override func viewDidLoad() {
        
        /*********************************** Add this code ************************************/
        
        //Define the default capture type of content, in this case a video from the camera
        guard let cameraDevice = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                failed()
                return
        }
        
        /*********************************** Add this code ************************************/
        
    }
    
    /*********************************** Add this code ************************************/
    
    func failed() {
        //Shows an Alert if there was an error during the camera setup for capture purposes
        let ac = UIAlertController(title: "Barcode detection not supported",
                                   message: "Your device doesn't support barcode detection.",
                                   preferredStyle: .alert)
        let alert = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        ac.addAction(alert)
        present(ac, animated: true, completion: nil)
    }
    
    /*********************************** Add this code ************************************/
    
}
