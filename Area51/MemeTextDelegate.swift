//
//  MemeTextDelegate.swift
//  Area51
//
//  Created by Jeff on 8/17/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import Foundation
import UIKit
class MemeTextDelegate: NSObject, UITextFieldDelegate {


    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: [UIColor.black],
        NSForegroundColorAttributeName: [UIColor.white],
        NSStrokeWidthAttributeName : -3.0,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 10)!
    ]
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Enter Text" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //dismiss(animated: true, completion: nil)
        
        return true;
        
    }
    
    
    
    
}
