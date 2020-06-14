//
//  WelcomeViewController.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/14/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var logButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setUpButtonsUI()
    }

    func setUpButtonsUI() {
        logButtons.forEach { button in
            // Rounding corners
            button.layer.cornerRadius = button.frame.size.height / 4
            button.layer.masksToBounds = false
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.clear.cgColor
            
            // Adding shadow
            button.layer.shadowColor = UIColor(named: "shadowColor")?.cgColor
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 12
            button.layer.shadowOffset = CGSize(width: 4, height: 10)
        }
    }
}
