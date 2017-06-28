//
//  ViewController.swift
//  SelfieCam
//
//  Created by Drew Fitzpatrick on 6/28/17.
//  Copyright © 2017 Drew Fitzpatrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cameraController : UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareAndPresentCameraController()
    }
    
    func prepareAndPresentCameraController() {
        let camera = UIImagePickerController()
        
        camera.sourceType = .camera
        camera.cameraDevice = .front
        camera.delegate = self
        camera.cameraViewTransform = CGAffineTransform(scaleX: -1.0, y: 1)
        camera.showsCameraControls = true
        camera.modalPresentationStyle = .fullScreen
        
        cameraController = camera
        present(cameraController!, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        for item in info {
            if let image = item.value as? UIImage {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                break
            }
        }
        
        picker.dismiss(animated: true, completion: {
            DispatchQueue.main.async {
                self.prepareAndPresentCameraController()
            }
        } )
    }

}

