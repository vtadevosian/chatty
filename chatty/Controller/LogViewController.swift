//
//  LogViewController.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/14/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    enum AuthType {
        case login, register
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet var logTextFields: [UITextField]!
    
    @IBOutlet weak var logButton: UIButton!
    
    var authType: AuthType? = .register
    
    private var isLoginType: Bool {
        return authType == .login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatPasswordTextField.isHidden = isLoginType
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.view.backgroundColor = isLoginType ? .bgColor2 : .bgColor3
        
        logTextFields.forEach { textField in
            textField.tintColor = isLoginType ? .tintColor2 : .tintColor4
            textField.textColor = isLoginType ? .tintColor2 : .tintColor4
        }
        
        logButton.setTitleColor(isLoginType ? .tintColor3 : .tintColor5, for: .normal)
        logButton.backgroundColor = isLoginType ? .tintColor2 : .tintColor4
        logButton.titleLabel?.textAlignment = .center
        logButton.titleLabel?.text = isLoginType ? "login" : "register"
        
        
        logButton.roundCorners()
        logButton.addShadow(color: UIColor(named:  "shadowColor")?.cgColor)
    }

}
