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
    
    private var isLoginType: Bool {
        return authType == .login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

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
        logButton.titleLabel?.text = isLoginType ? "login" : "register"

        logButton.roundCorners()
        logButton.addShadow(color: UIColor.shadowColor.cgColor)
    }
    
    @IBAction func logButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        if isLoginType {
            logIn(email: email, password: password)
        } else {
            register(email: email, password: password)
        }
    }
    
    private func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle auth error
                
                print(error.localizedDescription)
            } else {
                self.navigateToChatVC()
            }
        }
    }

    private func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
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
