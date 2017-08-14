//
//  VC_roshambo_result.swift
//  Area51
//
//  Created by Jeff on 8/13/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit

class VC_roshambo_result: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    var result: String! 
    var winLose: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        showResults()
    }
    
    func showResults()
    {
        if(result == "rock"){
            resultLabel.text = "Rock crushes scissors! \(winLose!)"
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
        } else if(result == "paper") {
            resultLabel.text = "Paper covers rock! \(winLose!)"
            self.resultImage.image = UIImage(named: "PaperCoversRock")
        } else if(result == "scissor") {
            resultLabel.text = "Scissors cuts paper! \(winLose!)"
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
        } else {
            resultLabel.text = "It's a tie!"
            self.resultImage.image = UIImage(named: "itsATie")
        }
    }
    
}

