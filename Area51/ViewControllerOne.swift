//
//  ViewControllerOne.swift
//  Area51
//
//  Created by Jeff on 8/8/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {

    var count = 0
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var greenControl: UISlider!
    @IBOutlet weak var blueControl: UISlider!
    
    @IBAction func CountBtnPressed(_ sender: Any) {
        incrementCount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showColorValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func incrementCount(){
        self.count += 1
        self.countLabel.text = "\(self.count)"
    }

    @IBAction func changeColorComponent() {
        
        // Make sure the program doesn't crash if the controls aren't connected
        if self.redControl == nil {
            return
        }
        
        let r: CGFloat = CGFloat(self.redControl.value)
        let g: CGFloat = CGFloat(self.greenControl.value)
        let b: CGFloat = CGFloat(self.blueControl.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        showColorValues()
        
    }
    
    func showColorValues(){
        self.redValue.text = "\(self.redControl.value)"
        self.greenValue.text = "\(self.greenControl.value)"
        self.blueValue.text = "\(self.blueControl.value)"
    }
    
    
}

