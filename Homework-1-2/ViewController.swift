//
//  ViewController.swift
//  Homework-1-2
//
//  Created by Lubov Kannika on 07.07.2021.
//


import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    @IBOutlet weak var redLightLabel: UIView!
    @IBOutlet weak var yellowLightLabel: UIView!
    @IBOutlet weak var greenLightLabel: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        startButton.layer.cornerRadius = 10
        
        redLightLabel.alpha = lightIsOff
        yellowLightLabel.alpha = lightIsOff
        greenLightLabel.alpha = lightIsOff
        
        print("Размер стороны, доступный в методае viewDidLoad: \(redLightLabel.frame.height)")
    }
    
    override func viewWillLayoutSubviews() {
        redLightLabel.layer.cornerRadius = redLightLabel.frame.width / 2
        yellowLightLabel.layer.cornerRadius = redLightLabel.frame.width / 2
        greenLightLabel.layer.cornerRadius = redLightLabel.frame.width / 2
        
        print("Размер стороны, доступный в методае viewWillLayoutSubviews: \(redLightLabel.frame.height)")
    }
     
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLightLabel.alpha = lightIsOff
            redLightLabel.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLightLabel.alpha = lightIsOff
            yellowLightLabel.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLightLabel.alpha = lightIsOn
            yellowLightLabel.alpha = lightIsOff
            currentLight = .red
        }
    }
}

