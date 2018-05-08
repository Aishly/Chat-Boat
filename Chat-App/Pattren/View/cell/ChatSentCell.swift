//
//  ChatSentCell.swift
//  Chat-App
//
//  Created by Pooja Negi on 02/05/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit

///------ from my side cell
class ChatSentCell: UITableViewCell {
 
    @IBOutlet weak var messageLB: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var userName: UILabel!
    
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
//
    
    // cell dispaly data
    func dispalyChatDetails(chat: Chat) {
        messageLB.text = chat.message
        timeLB.text = chat.sentOn
        userName.text = chat.fromName
    }

}
