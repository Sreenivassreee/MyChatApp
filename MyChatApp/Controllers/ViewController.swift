//
//  ViewController.swift
//  MyChatApp
//
//  Created by Sreenivas k on 13/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Apptitle: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden=true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden=false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        Apptitle.text="  MyChatApp"
        Apptitle.text=""
        var chatIndex=0
        let title = C.AppName
        for i in title{
            Timer.scheduledTimer(withTimeInterval: 0.15*Double(chatIndex), repeats: false) { (timer) in
                self.Apptitle.text?.append(i)
            }

            chatIndex+=1

        }
        
        
    }

   
    
}

