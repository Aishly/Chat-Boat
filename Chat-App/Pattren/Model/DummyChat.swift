//
//  DummyChat.swift
//  Chat-App
//
//  Created by Pooja Negi on 02/05/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import Foundation

class Chat {
    
    var msgId:Int
    var id: Int
    var fromName: String
    var message: String
    var recievedOn: String?
    var deliveredOn: String?
    var sentOn: String?
    var readOn: String?
    var chatCellType: ChatCellType
    
    init() {
        self.msgId = Int()
        self.id = Int()
        self.fromName = String()
        self.message = String()
        self.recievedOn = nil
        self.deliveredOn = nil
        self.sentOn = nil
        self.readOn = nil
        self.chatCellType = .none
    }
    
    init(msgId:Int, id: Int, fromName: String, message: String, recievedOn: String?, deliveredOn: String?, sentOn: String?, readOn: String?, chatCellType: ChatCellType) {
        
        self.msgId = msgId
        self.id = id
        self.fromName = fromName
        self.message = message
        self.recievedOn = "10:20 PM"
        self.deliveredOn = "10:20 PM"
        self.sentOn = "10:20 PM"
        self.readOn = "10:20 PM"
        self.chatCellType = chatCellType
    }
    
    init(chat: Chat) {
        self.msgId = chat.msgId
        self.id = chat.id
        self.fromName = chat.fromName
        self.message = chat.message
        self.recievedOn = chat.recievedOn
        self.deliveredOn = chat.deliveredOn
        self.sentOn = chat.sentOn
        self.readOn = chat.readOn
        self.chatCellType = chat.chatCellType
    }
    
    func dummyData() -> [Chat] {
        var chatDisplayArray: [Chat] = []
        
        let chat = Chat()  // sent by mine
        chat.id = Int(arc4random_uniform(4) + 1)
        chat.fromName = "Pooja"
        chat.message = "Hi...."
        chat.recievedOn = "10:20 PM"
        chat.chatCellType = .sent
        chatDisplayArray.append(chat)
        
        let chat1 = Chat()  // receive
        chat1.id = Int(arc4random_uniform(4) + 1)
        chat1.fromName = "PNKBKSH"
        chat1.message = "Hi,This is PNKBKSH.... enter your query."
        chat1.recievedOn = nil
        chat1.readOn = "10:20 PM"
        chat1.deliveredOn = "10:25 PM"
        chat1.sentOn = "10:20 PM"
        chat1.chatCellType = .recieved
        chatDisplayArray.append(chat1)
        
        let chat2 = Chat(chat: chat)
        chat2.id = Int(arc4random_uniform(4) + 1)
        chat2.message = "i want dispaly array of images in scrollview it should be automatically scroll the images in swift....."
        chat2.recievedOn = "10:30 PM"
        chatDisplayArray.append(chat2)
        
        
        let chat3 = Chat(chat: chat1)
        chat3.id = Int(arc4random_uniform(4) + 1)
        chat3.message = "Enter your key word this is chatbot... you will get automatica reply. Thanks."
        chat3.recievedOn = "11:30 PM"
        chatDisplayArray.append(chat3)
        

        return chatDisplayArray
    }
}
