//
//  ChatRecievedCell.swift
//  Chat-App
//
//  Created by Pooja Negi on 02/05/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit

///======chat from other side
class ChatRecievedCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var messageLB: UITextView!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var personNameLB: UILabel!
    
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
    
    //----- display receive data on cell
    func dispalyChatDetails(chat: Chat) {
        personNameLB.text = chat.fromName
        messageLB.text = chat.message
        timeLB.text  = chat.recievedOn
        messageLB.sizeToFit()
    }
    
}
