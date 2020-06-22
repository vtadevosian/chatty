//
//  ChatViewController.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/15/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMessageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            // Handle the error
            print(signOutError)
        }
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
    }
}
