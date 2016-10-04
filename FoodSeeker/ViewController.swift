//
//  ViewController.swift
//  FoodSeeker
//
//  Created by Ryan Lim on 10/3/16.
//  Copyright © 2016 Ryan Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Set up imagePicker for camera access
    var imagePicker: UIImagePickerController!
    
    @IBAction func cameraButtonClicked(_ sender: UIBarButtonItem) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.isEditing = true
        present(imagePicker, animated: true, completion: nil)
    }

    //callback to handle photo processing after user takes photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        
        if let extractedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            UIImageWriteToSavedPhotosAlbum(extractedImage, self, #selector(image), nil)
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "RecognitionVC") as! RecognitionViewController
            newVC.image = extractedImage
            show(newVC, sender: self)
        }
    }
    
    //function that will prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if id == "showImageIdentifier" {
                _ = segue.destination as! RecognitionViewController
            }
        }
    }
    
    //callback to handle potential error saving photo to photo library
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>) {
        
        if error == nil {
            let ac = UIAlertController(title: "Success!", message: "The photo has been saved to your photo library successfully.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Failure!", message: "The photo could not be saved to your photo library.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

