//
//  ViewController.swift
//  MyChatApp
//
//  Created by Sreenivas k on 13/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Apptitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Apptitle.text=""
        var chatIndex=0
        var title="MyChatApp"
        for i in title{
            Timer.scheduledTimer(withTimeInterval: 0.15*Double(chatIndex), repeats: false) { (timer) in
                self.Apptitle.text?.append(i)
            }
            
            chatIndex+=1
            
        }
        
        
    }

   
    
}

