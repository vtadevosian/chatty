//
//  ChatViewController.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/15/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMessageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
    }
}
