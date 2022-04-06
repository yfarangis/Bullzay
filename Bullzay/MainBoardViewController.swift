//
//  ViewController.swift
//  Bullzay
//
//  Created by MMM on 14/03/22.
//

import UIKit

class MainBoardViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //Number the player shall locate on the line.
    var guessingNumber: Int = Int.random(in: 1...100)
    //Score cumulated by the player.
    var score: Int = 0
    // round
    var round: Int  = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let normalThumbImage = UIImage(named: "SliderThumb-Normal")
        let highlightedThumbImage = UIImage (named:"SliderThumb-Highlighted")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        setUpTheGame()
    }

    @IBAction func didTapSelectButton(_ sender: Any) {
        //select a value from slider
        let sliderValue: Float = slider.value
        //convert this value to Int (sliderValueInt) to compare two values
        let sliderValueInt: Int = Int(sliderValue)
        //compare two values and if they coincide print in console
        let isValuesEqual = sliderValueInt == guessingNumber
        if isValuesEqual {
            //add 1 score
            score = score + 1
            //refresh lable value by adding scores
            scoreLabel.text = "Scores:" + "" + String(score)
            print ("Correct!")
        } else {
            print("You selected value\(sliderValueInt)")
        }
        //next round
       round += 1
       //refresh lable value with round
        roundLabel.text = "Round " + String(round)
        
       //
        updateGuessingNumber()
        
        if round == 10 {
            setUpTheGame()
        let alert = UIAlertController(title: "Game Over", message: "Score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style:.default, handler:nil))
            self.present(alert,animated: true, completion: nil)
            
            
            
            self.round = 1
            self.score = 0
        }
    }
    
    @IBAction func didTapTryAgainButton(_ sender: Any) {
        setUpTheGame()
    }
    
    func setUpTheGame() {
        // Set up the first round
        round = 0
        
        //Setting up the game
        // 1.Set the slider value to 50
        slider.value = 50
        
        // 2.Set the number to guess
        updateGuessingNumber()
        
        // 3.Set score to 0
        scoreLabel.text = "Score: " + String (score)
        
        roundLabel.text = "Round: " + String(round)
    }
    
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100)
        taskLabel.text = "Guess Number " + String (guessingNumber)
    }
    
    func updateRound () {
        round = +1
        roundLabel.text  = "Round: " + String(round)
    }
    
    
}

