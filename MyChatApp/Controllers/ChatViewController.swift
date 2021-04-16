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
    override func viewDidLoad() {
        navigationItem.hidesBackButton=true
        navigationItem.title="MyChatApp"
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
