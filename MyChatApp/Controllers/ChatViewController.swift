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
    var messages:[Message]=[]
    let db=Firestore.firestore()
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
    @IBOutlet weak var messBody: UITextField!
 
    @IBAction func sendPressed(_ sender: Any) {
        if let user=firebaseAuth.currentUser?.email,let mess=messBody.text{
            let timestamp = NSDate().timeIntervalSince1970
            db.collection(C.firebase.collection).addDocument(data: [C.firebase.messageBody:mess,
                                                                    C.firebase.messageSender:user,
                                                                    C.firebase.time:timestamp
            ]) { (error) in
                if let e = error{
                    print(e)
                }else{
                    print("Succefully Added")
                }
                
            }
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

