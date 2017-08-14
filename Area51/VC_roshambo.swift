//
//  VC_roshambo.swift
//  Area51
//
//  Created by Jeff on 8/10/17.
//  Copyright © 2017 JeffDeagostino. All rights reserved.
//

import UIKit

class VC_roshambo: UIViewController {
    
    var opponentPlay: String?
    var ourPlay: String?
    var youWon: Bool?
    var winner: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func randomPlay() {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        if(randomValue == 1){
            opponentPlay = "rock"
        } else if (randomValue == 2) {
            opponentPlay =  "paper"
        } else {opponentPlay = "scissor"}
    
        if(ourPlay == "rock"){
            if(opponentPlay == "rock"){
                youWon = false
                winner = "tie"
            } else if(opponentPlay == "paper") {
                youWon = false
                winner = "paper"
            } else {
                youWon = true
                winner = "rock"
            }
        }
        
        if(ourPlay == "paper"){
            if(opponentPlay == "rock"){
                youWon = true
                winner = "paper"
            } else if(opponentPlay == "paper") {
                youWon = false
                winner = "tie"
            } else {
                youWon = false
                winner = "scissor"
            }
        }
        
        if(ourPlay == "scissor"){
            if(opponentPlay == "rock"){
                youWon = false
                winner = "rock"
            } else if(opponentPlay == "paper") {
                youWon = true
                winner = "scissor"
            } else {
                youWon = false
                winner = "tie"
            }
        }
        
        
    
    }
    
    @IBAction func rock() {
        
        ourPlay = "rock"
        self.randomPlay()
        
        // Use hard coded segue
        showResults()
        
    }
    @IBAction func paper() {
        
        ourPlay = "paper"
        self.randomPlay()
        // Using SegueStoryBoard1. Created in storyboard by dragging from the button to the view, naming it, and overriding the prepare() funciton to pass the data.
        
    }
    @IBAction func scissor() {
        
        ourPlay = "scissor"
        self.randomPlay()
        //showResults()
        
        //Perform Segue by Identifier
        performSegue(withIdentifier: "SegueStoryBoard1", sender: self)
        
    }
    // hard coded segue
    func showResults()
    {
        var controller: VC_roshambo_result
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ID_Roshambo_Result") as! VC_roshambo_result
        
        controller.result = winner
        
        if(youWon == true){
            controller.winLose = "You Won!"
        } else {
            controller.winLose = "You lost!"
        }
        
        present(controller, animated: true, completion: nil)
   
    }
    // prepares data to be sent to storyboard segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! VC_roshambo_result
        
        controller.result = winner
        
        if(youWon == true){
            controller.winLose = "You Won!"
        } else {
            controller.winLose = "You lost!"
        }
    }
    
}


