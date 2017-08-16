//
//  RandomColorTextFieldDelegate.swift
//  Area51
//
//  Created by Jeff on 8/14/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import Foundation
import UIKit
class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
     let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    //    func randomColor() -> UIColor {
    //        // @TODO: return a random color
    //    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        textField.textColor = randomColor()
        
        return true
    }

    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        return colors[randomIndex]
    }

}
