//
//  Breakout.swift
//  Games
//
//  Created by period4 on 2/7/1400 AP.
//

import UIKit
import AVFoundation

class Breakout: UIViewController,UICollisionBehaviorDelegate {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var paddleB: UIView!
    @IBOutlet weak var circleThing: UIView!
    
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var ballDynamicBehavior: UIDynamicItemBehavior!
    var paddleDynamicBehavior: UIDynamicItemBehavior!
    var bricksDynamicBehavior: UIDynamicItemBehavior!
    
    @IBOutlet weak var brick1: UIView!
    @IBOutlet weak var brick2: UIView!
    @IBOutlet weak var brick3: UIView!
    @IBOutlet weak var brick4: UIView!
    @IBOutlet weak var brick5: UIView!
    @IBOutlet weak var brick6: UIView!
    @IBOutlet weak var brick7: UIView!
    @IBOutlet weak var brick8: UIView!
    var startingPoint: CGPoint = CGPoint(x: 100, y: 350)
    var allBricks = [UIView]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
         circleThing.layer.cornerRadius = 25
        allBricks = [brick1,brick2,brick3,brick4,brick5,brick6,brick7,brick8]
        paddleB.isHidden = true
        circleThing.isHidden = true
  }
    var brickC = 8

     @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        paddleB.center = CGPoint(x: sender.location(in: view).x, y: paddleB.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleB)
        
     }
    
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [circleThing], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.7)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.7
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [paddleB,circleThing] + allBricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
       
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [circleThing])
        ballDynamicBehavior .allowsRotation = true
        ballDynamicBehavior.elasticity = 1.0
        ballDynamicBehavior.friction = 0.0
        ballDynamicBehavior.resistance = 0.0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddleB])
        paddleDynamicBehavior.friction = 0.0
        paddleDynamicBehavior.density = 100000
        paddleDynamicBehavior.elasticity = 1.2
        paddleDynamicBehavior.resistance = 0.0
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        bricksDynamicBehavior = UIDynamicItemBehavior(items: allBricks)
        bricksDynamicBehavior.allowsRotation = false
        bricksDynamicBehavior.friction = 0.0
        bricksDynamicBehavior.density = 100000
        bricksDynamicBehavior.elasticity = 1.0
        bricksDynamicBehavior.resistance = 0.0
        dynamicAnimator.addBehavior(bricksDynamicBehavior)
        
        collisionBehavior.collisionDelegate = self
    }
    
    @IBAction func StartB(_ sender: UIButton) {
        dynamicBehaviors()
        sender.isHidden = true
        paddleB.isHidden = false
        circleThing.isHidden = false
        circleThing.center = startingPoint
        print("Test")
        let sound = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "Lets go")
        sound.speak(utterance)
    
            }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint){
            if p.y > paddleB.center.y + 20 {
                alert()
            }
        }
    func reset() {
        brickC = 8
        }
    
        func alert (){
            let losingAlert = UIAlertController(title: "You Lost!?", message: "You r very bad!?", preferredStyle: .alert)
            let newGameButton = UIAlertAction(title: "New Game?", style: .default){ (ACTION)  in
                
            }
                    losingAlert.addAction(newGameButton)
            present(losingAlert, animated: true, completion: nil)
        }
    
            
    func winalert () {
        let winningAlert = UIAlertController(title: "You Won!!", message: "Nice Job!!", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game?", style: .default){ (ACTION)  in
            
        }
                winningAlert.addAction(newGameButton)
        present(winningAlert, animated: true, completion: nil)
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for brick in allBricks{
            if item1.isEqual(circleThing) && item2.isEqual(brick) {
                brick.isHidden = true
                collisionBehavior.removeItem(brick)
                brickC = Int(brickC) - 1
                print(brickC)
                if brickC == 0 {
                    winalert()
                    ballDynamicBehavior.resistance = 1000
                    startButton.isHidden = false
                    brickC = 8
                    for brick in allBricks{
                        brick.isHidden = false
                    }
                }
            }
        }
    }
        
    
    
    
    
    
    
    
    
    
    

        
}
