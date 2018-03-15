//
//  ViewController.swift
//  guessingGameIos
//
//  Created by Americo Lopez on 3/12/18.
//  Copyright © 2018 Americo Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userGuessField: UITextField!
    @IBOutlet weak var userFeedbackLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var yesButtonOutlet: UIButton!
    @IBOutlet weak var noButtonOutlet: UIButton!
    
    
    var userGuess :Int?
    var randomNumber = Int(arc4random_uniform(100))
    var tries: Int = 1
    var rulesLabelText = """
⭐️⭐️⭐️⭐️⭐️RULES⭐️⭐️⭐️⭐️⭐️
rule 1. Guess a number 1-100
rule 2. You have 5 tries to get right
rule 3. You will be given hints
"""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.888774693, blue: 1, alpha: 1)
        rulesLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        rulesLabel.text = rulesLabelText
        yesButtonOutlet.isHidden = true
        noButtonOutlet.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func startOver() {
        randomNumber = Int(arc4random_uniform(100))
        tries = tries - 5
        userFeedbackLabel.text =  """
        your game has restarted,
        you can guess again
        """
        yesButtonOutlet.isHidden = true
        noButtonOutlet.isHidden = true
    }
    
    func game() {
        if userGuess == nil {
            userFeedbackLabel.text = "pls type in a number"
        }else if userGuess! > 100 || userGuess! < 0 {
            userFeedbackLabel.text = "pls type in a number 0-100"
        }else if userGuess! < randomNumber{
            userFeedbackLabel.text = "your guess was too low try again, number of tries used \(tries)"
            tries = 1 + tries
        }else if userGuess! > randomNumber {
            userFeedbackLabel.text = "your guess was too high try again, number of tries used \(tries) "
            tries = 1 + tries
        }else{
            userFeedbackLabel.text = "you got it right, it took this many tries to get it right \(tries) "
            startOver()
        }
    }
    
    @IBAction func guessButtonPressed(_ sender: Any) {
        userGuess = Int(userGuessField.text!)
        
        if tries >= 5{
            userFeedbackLabel.text = """
            you ran out of tries,
            do you wanna play again?
            yes or no
            """
            yesButtonOutlet.isHidden = false
            noButtonOutlet.isHidden = false
        }else{
            game()
        }
        
}

    @IBAction func yesButton(_ sender: Any) {
    startOver()
    }
    
    @IBAction func noButton(_ sender: Any) {
    exit(0)
    }
    
}
