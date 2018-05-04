//
//  SwiftChat.swift
//  Chat-App
//
//  Created by Pooja Negi on 01/05/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import Foundation
import UIKit // For using UIImage




enum ChatCellType: String {
    case recieved = "ChatRecievedCell"
    case sent = "ChatSentCell"
//    case categoryChange = "ChatCategoryCell"
//    case dateCell = "ChatDateCell"
    case none = "ChatNoneCell"
}




//
//// 1. Type Enum
///**
// Enum specifing the type
//
// - Mine:     Chat message is outgoing
// - Opponent: Chat message is incoming
// */
//enum BubbleDataType: Int{
//    case Mine = 0
//    case Opponent
//}
//
///// DataModel for maintaining the message data for a single chat bubble
//class ChatBubbleData {
//    // 2.Properties
//    var text:  String?
//    var image: UIImage?
//    var dateTime:  String?
//    var name:  String?
//    var type: BubbleDataType
//
//    // 3. Initialization
//    init(text: String?,image: UIImage?, dateTime: String , name:String, type:BubbleDataType = .Mine) {
//        // Default type is Mine
//        self.text = text
//        self.image = image
//        self.dateTime = dateTime
//        self.name  = name
//        self.type = type
//    }
//}




