////
////  ScannerViewController.swift
////  Order_Restaurant
////
////  Created by Nguyen Hung on 05/11/2022.
////
//
//import UIKit
//import AVFoundation
//
//class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
//
//    var video = AVCaptureVideoPreviewLayer()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // create session
//        let session = AVCaptureSession()
//        // define capture device
//        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
//        do {
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//            session.addInput(input)
//        } catch {
//            print("ERROR")
//        }
//        let output = AVCaptureMetadataOutput()
//        session.addOutput(output)
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
//
//        video = AVCaptureVideoPreviewLayer(session: session)
//        video.frame = view.layer.bounds
//        view.layer.addSublayer(video)
//
//        session.startRunning()
//    }
//
//    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
