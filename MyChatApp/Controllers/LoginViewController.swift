//
//  LoginViewController.swift
//  MyChatApp
//
//  Created by Sreenivas k on 16/04/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController{
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    let f=fire()
    override func viewDidLoad() {
        
    }
    @IBAction func LoginPressed(_ sender: Any) {
        
        if let email=email.text,let password=password.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let self = self else {
                return
              }
                if let e = error{
                    print(e)
                }else{
                    self.performSegue(withIdentifier: C.Seg.loginToChat, sender: self)
                    print("Sucessfully Login")
                }
                
            }
            

        }
        

    }
}
