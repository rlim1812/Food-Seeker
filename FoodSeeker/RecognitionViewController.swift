//
//  RecognitionViewController.swift
//  FoodSeeker
//
//  Created by Ryan Lim on 10/4/16.
//  Copyright © 2016 Ryan Lim. All rights reserved.
//

import UIKit

class RecognitionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (image == nil){
            self.dismiss(animated: true, completion: nil)
        } else {
            imageView.image = image
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
