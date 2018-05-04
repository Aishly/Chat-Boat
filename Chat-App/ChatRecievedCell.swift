//
//  ChatRecievedCell.swift
//  Chat-App
//
//  Created by Pooja Negi on 02/05/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit

class ChatRecievedCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
//    @IBOutlet weak var messageLB: UILabel!
     @IBOutlet weak var messageLB: UITextView!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var personNameLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(chat: Chat) {
        cardView.layer.cornerRadius = 5
        cardView.clipsToBounds = true
        
        personNameLB.text = chat.fromName
        messageLB.text = chat.message
        timeLB.text  = chat.recievedOn
        messageLB.sizeToFit()
    }
    
}
