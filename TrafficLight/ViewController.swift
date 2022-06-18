//
//  ViewController.swift
//  TrafficLight
//
//  Created by Ilya Kozhevnikov on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lights: [UIView]!
    @IBOutlet var selectorButton: UIButton!
    
    private var colorSelectorPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fadeAll()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundCorners()
    }

    @IBAction func pushSelectorButton() {
        selectorButton.setTitle("Next", for: .normal)
        fadeAll()
        lights[colorSelectorPosition].alpha = 1
        turnSelector()
    }
    
    private func fadeAll() {
        for light in lights {
            light.alpha = 0.1
        }
    }
    
    private func roundCorners() {
        for light in lights {
            light.layer.masksToBounds = true
            light.layer.cornerRadius = light.layer.frame.height * 0.5
        }
        selectorButton.layer.cornerRadius = 5
    }
    
    private func turnSelector() {
        colorSelectorPosition += 1
        if colorSelectorPosition == lights.count {colorSelectorPosition = 0}
    }
}

