//
//  Constants.swift
//  MyChatApp
//
//  Created by Sreenivas k on 16/04/21.
//

import Foundation

struct C {
    static let AppName = "MyChatApp"
    static let cellId="ReusableCell"
    
    struct Seg {
        static let loginToChat:String = "LoginToChat"
        static  let RegisterToChat:String = "RegisterToChat"
    }
    struct firebase {
        static let collection="Messeges"
        static let messageBody="MessageBody"
        static let messageSender="MessageSender"
        static let time="TimeStamp"
    }
    
}
