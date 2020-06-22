//
//  LogViewController.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/14/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit
import Firebase

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
    var auth = Auth.auth()
    private var isLoginType: Bool {
        return authType == .login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layout()
    }
    
    @IBAction func logButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        if isLoginType {
            logIn(email: email, password: password)
        } else {
            guard let repeatedPassword = repeatPasswordTextField.text Zelse {
                // Handle the error
                print("Password verification is missing.")
                return
            }
            
            if password == repeatedPassword {
                register(email: email, password: password)
            } else {
                // Handle the error
                print("Passwords mismatch.")
            }
        }
    }
    
    private func layout() {
        repeatPasswordTextField.isHidden = isLoginType
        
        let bgColor: UIColor = isLoginType ? .bgColor2 : .bgColor3
        let tintColor: UIColor = isLoginType ? .tintColor2 : .tintColor4
        let buttonColor: UIColor = isLoginType ? .tintColor3 : .tintColor5
        
        view.backgroundColor = bgColor
        navigationController?.navigationBar.tintColor = tintColor

        logTextFields.forEach { textField in
            textField.tintColor = tintColor
            textField.textColor = tintColor
        }

        logButton.setTitleColor(buttonColor, for: .normal)
        logButton.backgroundColor = tintColor
        logButton.titleLabel?.textAlignment = .center
        logButton.setTitle(isLoginType ? "login" : "register", for: .normal)

        logButton.roundCorners()
        logButton.addShadow(color: UIColor.shadowColor.cgColor)
    }
    
    private func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle auth error
                
                print(error.localizedDescription)
            } else {
                self.navigateToChatVC()
            }
        }
    }

    private func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle auth error
                print(error.localizedDescription)
            } else {
                self.navigateToChatVC()
            }
        }
    }
    
    private func navigateToChatVC() {
        self.performSegue(withIdentifier: "ChatSegue", sender: self)
    }
}
