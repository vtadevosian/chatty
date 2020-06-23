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
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil),
                           forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
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
        guard let messageBody = newMessageTextField.text,
            let messageSender = Auth.auth().currentUser?.email else { return }
        
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: messageSender,
            K.FStore.bodyField: messageBody]) { error in
                if let error = error {
                    // Handle the error
                    print("Data saving error: \(error)")
                } else {
                    print("Success")
                }
        }
    }
    
    private func loadMessages() {
        messages = []
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Data retrieval error: \(error)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        guard let messageSender = data[K.FStore.senderField] as? String,
                            let messageBody = data[K.FStore.bodyField] as? String else { return }
                        let newMessage = Message(sender: messageSender, body: messageBody)
                        self.messages.append(newMessage)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
}
