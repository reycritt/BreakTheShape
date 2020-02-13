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
        // Do any additional setup after loading the view.
        
        //timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: projectileMove(_:))
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(projectileMove(_:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func projectilePopped(_ sender: Any) {
        //timer?.invalidate()
        //self.projectile.frame.origin.y -= 200
        UIView.animate(withDuration: 0, animations: {
            self.projectile.frame.origin.y += 200
        })
    }
    
    @objc func projectileMove(_ sender: Any){
        //UIView.animate(withDuration: 0, animations: {
            //self.projectile.frame.origin.y += 10
        //})
    }


}

