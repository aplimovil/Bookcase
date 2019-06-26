//
//  BarcodeViewController.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/25/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import UIKit
import AVFoundation

class BarcodeViewController: UIViewController {
    
    //Object to store a BarcodeViewControllerDelegate instance
    var delegate:BarcodeViewControllerDelegate?
    
    //Defines a captureSession object to handle the camera capture process
    var captureSession: AVCaptureSession = AVCaptureSession()
    
    //Defines a PreviewLayer object to display the camera capture in the screen
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Define the default capture type of content, in this case a video from the camera
        guard let cameraDevice = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                failed()
                return
        }
        
        //Define the default capture input device, in this case the camera (back)
        guard let videoInput =
            try? AVCaptureDeviceInput(device: cameraDevice)
            else {
                //Handle a possible failure if the camera can´t be initialized
                failed()
                return
        }
        
        //Connect the video camera input to capture session
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
            //Shows an error message if connection was not successful
        } else {failed();return}
        
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
        
        //Define itself as a Delegate to be able to capture the metadata from input device
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        //Start the session to turn on the input device (camera) and capture the barcode from video
        captureSession.startRunning()
        
        //Add a preview to the root view of the controller to display camera input
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.frame
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
    }
    
    @IBAction func touchCancel(_ sender: UIBarButtonItem) {
        //Dissmiss the current scene if user cancels the barcode detection
        dismiss(animated: true, completion: nil)
    }
    
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
    
    
}

//Delegate protocol implementation for barcode readings notification
protocol BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String)
}

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

