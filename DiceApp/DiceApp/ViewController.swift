//
//  ViewController.swift
//  DiceApp
//
//  Created by Macbook Air on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rhsDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceImagesEnum: [UIImage] = [
        .dice1, .dice2, .dice3, .dice4, .dice5, .dice6
    ]
    
    let diceRollImages: [UIImage] = [
        .roll1, .roll2, .roll3, .roll4, .roll5, .roll6, .roll7, .roll8, .roll9
    ]
    
    let rollTime = 50        
    let rollSpeed = 0.025     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lhsDice.image = .dice1
        rhsDice.image = .dice1
        rollButton.tintColor = .white
    }
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        for i in 0...rollTime {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * rollSpeed) {
                self.lhsDice.image = self.diceRollImages.randomElement()
                self.rhsDice.image = self.diceRollImages.randomElement()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(rollTime) * rollSpeed) {
            self.lhsDice.image = self.diceImagesEnum.randomElement()
            self.rhsDice.image = self.diceImagesEnum.randomElement()
        }
    }
}
