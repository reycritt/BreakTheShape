//
//  ViewController.swift
//  BreakTheShape
//
//  Created by cory on 2/12/20.
//  Copyright © 2020 royalty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var projectile: UIButton!//The projectile (might be able to use multiple calls to create new buttons or control 8 existing buttons)
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    var timer: Timer?//Timer for the projectile
    var maxPlayerHealth = 100//Health should be based on shop value
    var coins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.projectile.frame.origin.y = -300
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
        
        healthLabel.text = "\(maxPlayerHealth)"
        
    }
    
    @IBAction func projectilePopped(_ sender: Any) {
        timer?.invalidate()
        self.projectile.frame.origin.y = -300
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
    }
    
    /*
     Controls movement of projectile. If it hits a certain point, it resets (might be programmable to make it hit the shop)
     */
    @objc func projectileMove(_ sender: Timer){
        self.projectile.frame.origin.y += 40//Moves 20 pixels
        print(projectile.frame.origin.y)
        if (projectile.frame.origin.y >= 600){
            print("over")
            maxPlayerHealth -= 10
            coins -= 5
            healthLabel.text = "\(maxPlayerHealth)"
            coinsLabel.text = "\(coins)"
            timer?.invalidate()
            self.projectile.frame.origin.y = -300
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
        }
        /*
         if (projectile.frame.height <= 100){
         timer?.invalidate()
         self.projectile.frame.origin.y = -300
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
         }
         */
    }
    
    @IBAction func squareTapped(_ sender: Any) {
        print("Square tapped")
        coins += 5
        coinsLabel.text = "\(coins)"
    }
    
    
}

