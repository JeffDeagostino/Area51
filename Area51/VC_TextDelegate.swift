//
//  VC_TextDelegate.swift
//  Area51
//
//  Created by Jeff on 8/14/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit

class VC_TextDelegate: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    // Text Filed Delegate objects
    let zipDelegate = ZipCodeTextDelegate()
    let cashDelegate = CashTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
    
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterCountLabel.isHidden = true
        
        // Set the delegates
        self.textField1.delegate = randomColorDelegate
        self.textField2.delegate = zipDelegate
        self.textField3.delegate = cashDelegate
        self.textField4.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.isHidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }
    
    // MARK: Text Field Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    // MARK: Actions
    
    @IBAction func toggleTheTextEditor(_ sender: AnyObject) {
        
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
}
