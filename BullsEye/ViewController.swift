//
//  ViewController.swift
//  BullsEye
//
//  Created by Adam Bufalini on 1/16/23.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    
    var targetValue = 0
    
    var score = 0
    
    var round = 0
    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var targetLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var roundLabel: UILabel!
    
    @IBOutlet var startOverLabel: UILabel!
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = UIImage(named:"SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizeable =  trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizeable =  trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackRightResizeable, for: .normal)
        startOver()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey:nil)
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect! 100 Bonus Points!"
            points += 100
        } else if difference == 1 {
            title = "One away from Bull's Eye! 50 Bonus points!"
            points += 50
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title, message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)
    }
}

