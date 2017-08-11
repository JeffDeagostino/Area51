//
//  VC_roshambo.swift
//  Area51
//
//  Created by Jeff on 8/10/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit

class VC_roshambo: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func randomPlay() -> String {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        if(randomValue == 1){
            return "rock"
        } else if (randomValue == 2) {
            return "paper"
        } else {return "scissor"}
    }
    
    @IBAction func rock() {
        
        let opponent = randomPlay()
        
        if(opponent == "scissor"){
            rockWins()
        } else if(opponent == "paper") {
            paperWins()
        } else {
            tie()
        }
    }
    @IBAction func paper() {
        
        let opponent = randomPlay()
        
        if(opponent == "scissor"){
            scissorWins()
        } else if(opponent == "rock") {
            paperWins()
        } else {
            tie()
        }
    }
    @IBAction func scissor() {
        
        let opponent = randomPlay()
        
        if(opponent == "rock"){
            rockWins()
        } else if(opponent == "paper") {
            scissorWins()
        } else {
            tie()
        }
    }
    func tie()
    {
        resultLabel.text = "It's a tie!"
        self.resultImage.image = UIImage(named: "itsATie")
    
    }
    func rockWins()
    {
        resultLabel.text = "Rock crushes scissors!"
        self.resultImage.image = UIImage(named: "RockCrushesScissors")
        
    }
    func paperWins()
    {
        resultLabel.text = "Paper covers rock!"
        self.resultImage.image = UIImage(named: "PaperCoversRock")
        
    }
    func scissorWins()
    {
        resultLabel.text = "Scissors cuts paper!"
        self.resultImage.image = UIImage(named: "ScissorsCutPaper")
        
    }
    
}


