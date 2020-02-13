//
//  ViewController.swift
//  BreakTheShape
//
//  Created by cory on 2/12/20.
//  Copyright © 2020 royalty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var projectile: UIButton!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.projectile.frame.origin.y = -300
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func projectilePopped(_ sender: Any) {
        timer?.invalidate()
        self.projectile.frame.origin.y = -300
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func projectileMove(_ sender: Timer){
        self.projectile.frame.origin.y += 20
        print(projectile.frame.origin.y)
        if (projectile.frame.origin.y >= 600){
            print("over")
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
    
    
}

