//
//  ViewController.swift
//  BreakTheShape
//
//  Created by cory on 2/12/20.
//  Copyright © 2020 royalty. All rights reserved.
//

import UIKit
import SpriteKit//Sprite kit??? Use for animations/movement I believe

class ViewController: UIViewController {
    
    @IBOutlet weak var projectile: UIButton!//The projectile (might be able to use multiple calls to create new buttons or control 8 existing buttons)
    @IBOutlet weak var healthLabel: UILabel!//Displays current player health
    @IBOutlet weak var coinsLabel: UILabel!//Displays current player coins
    @IBOutlet weak var playerView: UIView!//Represents the player in-game
    var timer: Timer?//Timer for the projectile
    var maxPlayerHealth = 100//Max health of player
    var currentPlayerHealth = 100//Current health of player
    var maxSquareHealth = 100//Max health of square; should be based/modified by squareLevel
    var currentSquareHealth = 100//Current health of square; only visible through imagery, not labels
    var squareLevel = 1//For every increment, increases max health and uses new attack every so often
    var coins = 0//Amount of currency player has
    
    /*
     Sets basic movement of projectile (temporary)
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.projectile.frame.origin.y = -300
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
        
        healthLabel.text = "\(currentPlayerHealth)"
        
    }
    
    /*
     When projectile is tapped, damage is avoided and projectile resets
     */
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
        
        if (projectile.frame.origin.y >= playerView.frame.origin.y){//playerView was originally 600; needs to be programmed so it fits all screens (auto layout needed)
            print("over")
            if (currentPlayerHealth > 0){
                currentPlayerHealth -= 10
            }
            coins -= 5//Will be part of coin checker
            healthLabel.text = "\(currentPlayerHealth)"
            coinsLabel.text = "\(coins)"
            timer?.invalidate()
            self.projectile.frame.origin.y = -300
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
        }
    }
    
    /*
     When square tapped, player gains coins; also levels up square if health is depleted by player tapping
     */
    @IBAction func squareTapped(_ sender: Any) {
        //print("Square tapped")
        coins += 5
        coinsLabel.text = "\(coins)"
        currentSquareHealth -= 5
        if (currentSquareHealth <= 0){
            print("Add square level")
            squareLevel += 1
            //Increase maxSquareHealth on some interval
            currentSquareHealth = maxSquareHealth
        }
    }
    
    /*
     Increases player health at the cost of coins; cannot go over max health defined for player
     */
    @IBAction func addHealth(_ sender: Any) {
        if (coins > 10 && currentPlayerHealth < maxPlayerHealth) {//Where 10 is the cost of hlth+
            coins -= 10
            coinsLabel.text = "\(coins)"
            currentPlayerHealth += 5
            healthLabel.text = "\(currentPlayerHealth)"
            //Perhaps create a func/if... that stops health from going above max, which should be based on upgrades
        }
    }
    
//    func levelFive(){//Decreases player health constantly for increased difficulty
//        if (squareLevel >= 5){
//            currentPlayerHealth -= 5
//        }
//    }
    
    /*
     An example checker that can be reused/placed in other file that checks if it can remove something from the player but only if it exists before
     */
    func coinChecker(){}
    
}

