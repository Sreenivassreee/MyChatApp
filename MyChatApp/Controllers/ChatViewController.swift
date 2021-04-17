//
//  ChatViewController.swift
//  MyChatApp
//
//  Created by Sreenivas k on 16/04/21.
//

import UIKit
import Firebase


class ChatViewController:UIViewController{
    let firebaseAuth = Auth.auth()
    var messages:[Message]=[
        Message(sender: "1@2.com", messagebody: "Hey"),
        Message(sender: "ab@2.com", messagebody: "Hey Raj,Hey Raj")
        ]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        navigationItem.hidesBackButton=true
        navigationItem.title=C.AppName
        tableView.dataSource=self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: C.cellId)
        
    }
    @IBAction func logoutPresed(_ sender: Any) {
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.cellId,for: indexPath) as! MessageCell
        cell.messageLable?.text=messages[indexPath.row].messagebody
        return cell
        
    }
    
    
}

