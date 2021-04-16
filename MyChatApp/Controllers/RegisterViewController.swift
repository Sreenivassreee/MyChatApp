//
//  RegisterViewController.swift
//  MyChatApp
//
//  Created by Sreenivas k on 16/04/21.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController{
    
    let f=fire()
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        
    }
    
    @IBAction func RegisterPresed(_ sender: UIButton) {
    
        if let email=emailField.text, let password=passwordField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e=error{
                    print("Register Faild")
                    print(e)
                }else{
                    self.performSegue(withIdentifier: C.Seg.RegisterToChat, sender:self)
                    print("Successfuly Register")
                }
              
            }
        
        }else{
            print("Failed Register")
        }
        

    }
}
