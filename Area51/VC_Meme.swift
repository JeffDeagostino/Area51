//
//  VC_Meme.swift
//  Area51
//
//  Created by Jeff on 8/14/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class VC_Meme: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var SelectedImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    // Text Filed Delegate objects
    let textDelegate = MemeTextDelegate()
    
    
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: [UIColor.black],
        NSForegroundColorAttributeName: [UIColor.green],
        NSStrokeWidthAttributeName : -3.0,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 10)!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        SelectedImageView.center = view.center
        
        //self.topTextField.delegate = textDelegate
        //self.bottomTextField.delegate = textDelegate
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = .center;
        bottomTextField.textAlignment = .center;
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        subscribeToKeyboardNotifications()
        
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("Device did rotate")
        coordinator.animate(alongsideTransition: { (_) in self.SelectedImageView.center = self.view.center}, completion: nil)
    }
    
    
    /////////////    Select Image functions     /////////////
    
    // Tells the delegate that the user picked a still image or movie.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            SelectedImageView.image = image
            SelectedImageView.contentMode = .scaleAspectFit
        }
        
        dismiss(animated: true, completion: nil)
    }
    // Tells the delegate that the user cancelled the pick operation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func pick(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.present(imagePicker, animated:true, completion:nil)
    }
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
   
    //////////////     Keyboard functions    /////////////
    func keyboardWillShow(_ notification:Notification) {
        
        view.frame.origin.y = 0 - getKeyboardHeight(notification)
    }
    
    func keyboardWillHide(_ notification:Notification) {
        
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Enter Text" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //dismiss(animated: true, completion: nil)
        //view.frame.origin.y = 0
        
        return true;
        
    }
    
}
