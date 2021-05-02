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
    @IBOutlet weak var messBody: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        navigationItem.hidesBackButton=true
        navigationItem.title=C.AppName
        tableView.dataSource=self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: C.cellId)
        getMess()
    }
    @IBAction func logoutPresed(_ sender: Any) {
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func getMess(){
  
        db.collection(C.firebase.collection).order(by: C.firebase.time).addSnapshotListener{ (snap, error) in
            self.messages=[]
            if let s=snap{
                for i in s.documents{
                    let d=i.data()
                    if let sender=d[C.firebase.messageSender] as? String, let body = d[C.firebase.messageBody] as? String {
                        let new = Message(sender:sender, messagebody:body)
                        self.messages.append(new)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let index=IndexPath(row: self.messages.count-1, section: 0)
                            self.tableView.scrollToRow(at: index, at: .top, animated: false)
                        }
                    }
                }
            }
        }
    }

    

    
    @IBAction func sendPressed(_ sender: Any) {
        if let user=firebaseAuth.currentUser?.email,let mess=messBody.text{
            if !(mess == ""){
                let timestamp = NSDate().timeIntervalSince1970
                db.collection(C.firebase.collection).addDocument(data: [C.firebase.messageBody:mess,
                                                                        C.firebase.messageSender:user,
                                                                        C.firebase.time:timestamp
                ]) { (error) in
                    if let e = error{
                        print(e)
                    }else{
                        print("Succefully Added")
                        
                        DispatchQueue.main.async {
                            self.messBody.text=""
                        }
                        
                    }
                    
                }
            }else{
                print("Message is Empty")
            }
         
        }
    }
}

extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message=messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: C.cellId,for: indexPath) as! MessageCell
        cell.messageLable?.text = message.messagebody
        
        
        if message.sender==Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden=true
            cell.rightImageView.isHidden=false
            cell.messageBubol.backgroundColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            cell.messageLable.textColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else{
            cell.leftImageView.isHidden=false
            cell.rightImageView.isHidden=true
            cell.messageBubol.backgroundColor=#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            cell.messageLable.textColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
   
        return cell
        
    }
    
    
}

