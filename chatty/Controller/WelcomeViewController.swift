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
            button.roundCorners()
            button.addShadow(color: UIColor(named: "shadowColor")?.cgColor)
        }
    }
}
