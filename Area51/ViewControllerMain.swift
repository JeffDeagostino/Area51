//
//  ViewControllerMain.swift
//  Area51
//
//  Created by Jeff on 8/8/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController {
    
    
    @IBAction func pickImageView(){
        let nextController = UIImagePickerController()
        self.present(nextController, animated:true, completion:nil)
    }
    @IBAction func activityView() {
        
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func alertView() {
        
        let controller = UIAlertController()
        controller.title = "Test Alert"
        controller.message = "This is a test"
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
        }
        
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
    //    @IBAction func roshambo() {
//        self.performSegue(withIdentifier: "Segue2Rashambo", sender: self)
//        
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
