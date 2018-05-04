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
        var chatArr: [Chat] = []
        
        
//        let chat = Chat()  // sent by mine
//        chat.id = Int(arc4random_uniform(4) + 1)
//        chat.fromName = "Pooja"
//        chat.message = "Hi, Vaishali?"
//        chat.recievedOn = "10:20 PM"
//        chat.chatCellType = .sent
//        chatArr.append(chat)
        
        let chat1 = Chat()  // receive
        chat1.id = Int(arc4random_uniform(4) + 1)
        chat1.fromName = "PNKBKSH"
        chat1.message = "Hi,This is PNKBKSH.... enter your query."
        chat1.recievedOn = nil
        chat1.readOn = "10:20 PM"
        chat1.deliveredOn = "10:25 PM"
        chat1.sentOn = "10:20 PM"
        chat1.chatCellType = .recieved
        chatArr.append(chat1)
        
//        let chat2 = Chat(chat: chat1)
//        chat2.id = Int(arc4random_uniform(4) + 1)
//        chat2.message = "i want dispaly array of images in scrollview it should be automatically scroll the images in swift....."
//        chat2.recievedOn = "10:30 PM"
//        chat2.chatCellType = .sent
//        chatArr.append(chat2)
//
//        let chat3 = Chat(chat: chat1)
//        chat3.id = Int(arc4random_uniform(4) + 1)
//        chat3.message = "Used Firebase in one of the Android app. All the database operations were happening like charm and now, nothing is working except the login."
//        chat3.recievedOn = "11:22 PM"
//        chat3.chatCellType = .recieved
//        chatArr.append(chat3)
//
//        let chat4 = Chat(chat: chat)
//        chat4.id = Int(arc4random_uniform(4) + 1)
//        chat4.message = "I think they do not rely on push notifications to get the data, they keep on sending server calls and constantly update the application and use push notification only to let user know there is a new message"
//        chat4.recievedOn = nil
//        chat4.readOn = "10:20 PM"
//        chat4.deliveredOn = "12:20 PM"
//        chat4.sentOn = "10:30 PM"
//        chat4.chatCellType = .sent
//        chatArr.append(chat4)
//
//
//        let chat5 = Chat(chat: chat)
//        chat5.id = Int(arc4random_uniform(4) + 1)
//        chat5.message = "भगवान प्यार सबको देता है। दिल भी सबको देता है। और दिल में बसने वाला भी देता है। पर दिल को समझने वाला नसीब वालों को ही देता है।🙏सुबह सुबह का वन्दन🙏 🌺आज आपका हरपल शुभ हो🌺"
//        chat5.recievedOn = nil
//        chat5.readOn = "10:40 PM"
//        chat5.deliveredOn = "01:20 PM"
//        chat5.sentOn = "10:20 PM"
//        chat5.chatCellType = .sent
//        chatArr.append(chat5)

        
//        let chat = Chat()
//        chat.id = Int(arc4random_uniform(4) + 1)
//        chat.fromName = "Vaishali"
//        chat.message = "Hi, How can I help you?"
//        chat.recievedOn = "10:20 PM"
//        chat.chatCellType = .recieved
//        chatArr.append(chat)
//
//        let chat1 = Chat(chat: chat)
//        chat1.id = Int(arc4random_uniform(4) + 1)
//        chat1.fromName = "Pooja"
//        chat1.message = "Hi"
//        chat1.recievedOn = nil
//        chat1.readOn = "10:20 PM"
//        chat1.deliveredOn = "10:20 PM"
//        chat1.sentOn = "10:20 PM"
//        chat1.chatCellType = .sent
//        chatArr.append(chat1)
//
//        let chat2 = Chat(chat: chat)
//        chat2.id = Int(arc4random_uniform(4) + 1)
//        chat2.message = "i want dispaly array of images in scrollview it should be automatically scroll the images in swift....."
//        chat2.recievedOn = "10:20 PM"
//        chat2.chatCellType = .recieved
//        chatArr.append(chat2)
//
//        let chat3 = Chat(chat: chat)
//        chat3.id = Int(arc4random_uniform(4) + 1)
//        chat3.message = "Used Firebase in one of the Android app. All the database operations were happening like charm and now, nothing is working except the login."
//        chat3.recievedOn = "10:22 PM"
//        chat3.chatCellType = .recieved
//        chatArr.append(chat3)
//
//        let chat4 = Chat(chat: chat)
//        chat4.id = Int(arc4random_uniform(4) + 1)
//        chat4.message = "I think they do not rely on push notifications to get the data, they keep on sending server calls and constantly update the application and use push notification only to let user know there is a new message"
//        chat4.recievedOn = nil
//        chat4.readOn = "10:20 PM"
//        chat4.deliveredOn = "10:20 PM"
//        chat4.sentOn = "10:30 PM"
//        chat4.chatCellType = .sent
//        chatArr.append(chat4)
//
//
//        let chat5 = Chat(chat: chat)
//        chat5.id = Int(arc4random_uniform(4) + 1)
//        chat5.message = "भगवान प्यार सबको देता है। दिल भी सबको देता है। और दिल में बसने वाला भी देता है। पर दिल को समझने वाला नसीब वालों को ही देता है।🙏सुबह सुबह का वन्दन🙏 🌺आज आपका हरपल शुभ हो🌺"
//        chat5.recievedOn = nil
//        chat5.readOn = "10:40 PM"
//        chat5.deliveredOn = "10:20 PM"
//        chat5.sentOn = "10:20 PM"
//        chat5.chatCellType = .sent
//        chatArr.append(chat5)

        return chatArr
    }
}
