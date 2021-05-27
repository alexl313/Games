//
//  ViewController.swift
//  Games
//
//  Created by period4 on 1/16/1400 AP.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    
    
    @IBOutlet weak var vview: UIView!
    
    @IBOutlet weak var winLabel: UILabel!
    
    var allLabels: [UILabel] = []
    

    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var crossImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
            allLabels = [labelOne,labelTwo,labelThree,labelFour,labelFive,labelSix,labelSeven,labelEight,labelNine]
        turnLabel.text = "X"
}
    
    
@IBAction func tapG(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: vview)
        for label in allLabels{
            if label.frame.contains(selectedPoint){
                placeInToLabel(myLabel: label)
            }
        }
        checkForWinner()
}
    
    
func checkForWinner(){
        
    if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text  && labelOne.text != "" {
                winLabel.text = String(labelOne.text!) + " Wins!"
                alert()
           // crossImage.image = UIImage(named: <#T##String#>)
        }
        
        if labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != "" {
                winLabel.text = String(labelOne.text!) + " Wins!"
                alert()
            //crossImage.image = UIImage(named: <#T##String#>)
        }
        
        
        if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != "" {
                winLabel.text = String(labelOne.text!) + " Wins!"
                alert()
            //crossImage.image = UIImage(named: "Diagonal Line R")
        }
        
        
        if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != "" {
                winLabel.text = String(labelTwo.text!) + " Wins!"
                alert()
            //crossImage.image = UIImage(named: "Vertical Line")
        }
        
        if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != "" {
                winLabel.text = String(labelThree.text!) + " Wins!"
                alert()
            //crossImage.image = UIImage(named: <#T##String#>)
        }
        
        if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != "" {
                winLabel.text = String(labelFour.text!) + " Wins!"
                alert()
            //crossImage.image = UIImage(named: "Horizontal Line")
        }
        
        if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != "" {
                winLabel.text = String(labelSeven .text!) + " Wins!"
                alert()
            //crossImage.image = UIImage(named: <#T##String#>)
        }
        
        if labelSeven.text == labelFive.text && labelFive.text == labelThree.text && labelSeven.text != "" {
                winLabel.text = String(labelSeven.text!) + " Wins!"
                alert()
            crossImage.image = UIImage(named: "Line 1")
        }
}


func placeInToLabel(myLabel: UILabel){
    if myLabel.text == ""{
        if turnLabel.text == "X"{
            myLabel.text = turnLabel.text
            turnLabel.text = "O"
        }
            else{
                myLabel.text = turnLabel.text
                turnLabel.text = "X"
            }
    }
}
    
    
func alert (){
        let winningAlert = UIAlertController(title: "YOU WON DUDE!!!", message: "Nice Job!", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game?", style: .default){ (ACTION)  in
            self.reset()
        }
            winningAlert.addAction(newGameButton)
    present(winningAlert, animated: true, completion: nil)
}
func reset () {
        for label in allLabels {
            label.text = ""
            winLabel.text = "Who Will Win???"
            crossImage.image = UIImage(named: "")
        }
}
    
    
    
    
    
}
