//
//  WelcomeViewController.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/14/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet var logButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLogo()
        setUpButtonsUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LogVC") as? LogViewController {
            vc.authType = .register
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LogVC") as? LogViewController {
            vc.authType = .login
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setUpButtonsUI() {
        logButtons.forEach { button in
            button.roundCorners()
            button.addShadow(color: UIColor(named: K.BrandColors.shadowColor)?.cgColor)
        }
    }
    
    private func animateLogo() {
        logoLabel.text = "🖊"
        
        for (index, letter) in K.appName.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.2 * Double(index), repeats: false) { (timer) in
                self.logoLabel.text?.removeLast()
                self.logoLabel.text?.append("\(letter)🖊")
            }
        }
    }
}
