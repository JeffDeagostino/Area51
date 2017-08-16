//
//  ZipCodeTextDelegate.swift
//  Area51
//
//  Created by Jeff on 8/14/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import Foundation
import UIKit
class ZipCodeTextDelegate: NSObject, UITextFieldDelegate {

    let digits = CharacterSet.decimalDigits

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return newText.length <= 5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
            
    }
        
//        
//        let s = textField.text
//        
//        var length = s?.characters.count
//        
//        if (length! > 5)
//        {
//            length = 5
//        }
//        
//        
//        if(s != "" && length! == 5)
//        {
//            let start = s?.startIndex
//            let end = s?.index((s?.endIndex)!, offsetBy: length!-1)
//            let substring = s?[start!..<end!]
//            
//            textField.text = substring
//        }
        
        
//        return true
//    }
    
}
