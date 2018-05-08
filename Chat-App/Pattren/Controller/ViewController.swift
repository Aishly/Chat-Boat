//
//  ViewController.swift
//  Chat-App
//
//  Created by Pooja Negi on 01/05/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit
import ApiAI
import AVFoundation

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var chatTV: UITableView!
    @IBOutlet weak var messageTF:UITextField!
    
    var chatArr: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTF.delegate = self
        self.chatTV.register(UINib(nibName: "ChatRecievedCell", bundle: nil), forCellReuseIdentifier: "ChatRecievedCell")
        self.chatTV.register(UINib(nibName: "ChatSentCell", bundle: nil), forCellReuseIdentifier: "ChatSentCell")
         self.chatTV.register(UINib(nibName: "ChatNoneCell", bundle: nil), forCellReuseIdentifier: "ChatNoneCell")
        
        //if want to show predeind chat
            chatArr = Chat().dummyData()
            chatTV.scrollToBottom()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

     //MARK:- send button
    @IBAction func sendTapped(_ sender: UIButton) {
        
        guard let message = messageTF.text else {
            return
        }
        if !(message.isEmpty) {
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm: aa"
            let date = Date()
            let dateString = dateFormatter.string(from: date)
            chatArr.append(Chat(msgId:1+message.count ,  id: 1, fromName: "ME", message: message.trim, recievedOn: dateString, deliveredOn: dateString, sentOn: dateString, readOn: dateString, chatCellType: .sent))
        }
        view.endEditing(true)
        chatTV.reloadData()
        chatTV.scrollToBottom()
        
        
        DispatchQueue.main.async {
            self.send_Msg_ToChatBot(msg: self.messageTF.text!)
        }
    }
    
    
    //MARK:- Text field Done function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        // Send button clicked
        if !((textField.text?.isEmpty)!) {

            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm: aa"
            let date = Date()
            let dateString = dateFormatter.string(from: date)

            chatArr.append(Chat(msgId:1+(textField.text?.count)! ,  id: 2, fromName: "me", message: (textField.text?.trim)!, recievedOn: dateString, deliveredOn: dateString, sentOn: dateString, readOn: dateString, chatCellType: .sent))
//            messageTF.text = ""
        }

        textField.resignFirstResponder()
        view.endEditing(true)
        chatTV.reloadData()
        chatTV.scrollToBottom()
        
        DispatchQueue.main.async {
            self.send_Msg_ToChatBot(msg: self.messageTF.text!)
        }
        return true
    }
    
     //MARK:- Send to chat bot
    func send_Msg_ToChatBot(msg:String?){
        
        let request = ApiAI.shared().textRequest()
        if let text = msg, text != "" {
            request?.query = text
        } else {
            return
        }
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            //            if let textResponse = response.result.fulfillment.speech  // textResponse is string{
            if let textResponse = response.result.fulfillment.messages {
                
                let textRespoArray = textResponse[0] as NSDictionary
                print(textResponse)
                self.speechAndText(text:  textRespoArray.value(forKey: "speech") as! String)
            }
        }, failure: { (request, error) in
            print(error!)
        })
        
        ApiAI.shared().enqueue(request)
        messageTF.text = ""
        
        view.endEditing(true)
        chatTV.reloadData()
        chatTV.scrollToBottom()
    }
    
    
    
     //MARK:- Recevied item
    ///======== if need speaker ==========///
    //    let speechSynthesizer = AVSpeechSynthesizer()
    
    func speechAndText(text: String) {
        ///======== if need speaker ==========///
        /*       let speechUtterance = AVSpeechUtterance(string: text)
         speechSynthesizer.speak(speechUtterance)*/
        ///==================================///
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.chatArr.append(Chat(msgId:1+(text.count) ,  id: 2, fromName: "PNKBKSH", message: (text), recievedOn: "now", deliveredOn: "now", sentOn: "now", readOn: "now", chatCellType: .recieved))
            self.view.endEditing(true)
            self.chatTV.reloadData()
            self.chatTV.scrollToBottom()
            
        }, completion: nil)
    }
    
    

}


extension ViewController:UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  chatArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let chat = chatArr[indexPath.row]
        
        switch chat.chatCellType {
        case .recieved:
            guard let cell = chatTV.dequeueReusableCell(withIdentifier: "ChatRecievedCell") as? ChatRecievedCell else {
                return UITableViewCell()
            }
            cell.dispalyChatDetails(chat: chat)
            return cell
            
        case .sent:
            guard let cell = chatTV.dequeueReusableCell(withIdentifier: "ChatSentCell") as? ChatSentCell else {
                return UITableViewCell()
            }
            cell.dispalyChatDetails(chat: chat)
            return cell
        case .none:
            guard let cell = chatTV.dequeueReusableCell(withIdentifier: "ChatNoneCell") as? ChatNoneCell else {
                return UITableViewCell()
            }
             cell.setupCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Typing started")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("Tying ended")
    }
}

