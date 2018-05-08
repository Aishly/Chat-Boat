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
    
//    var oldChatArray:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTF.delegate = self
        self.chatTV.register(UINib(nibName: "ChatRecievedCell", bundle: nil), forCellReuseIdentifier: "ChatRecievedCell")
        self.chatTV.register(UINib(nibName: "ChatSentCell", bundle: nil), forCellReuseIdentifier: "ChatSentCell")
         self.chatTV.register(UINib(nibName: "ChatNoneCell", bundle: nil), forCellReuseIdentifier: "ChatNoneCell")
        
        chatArr = Chat().dummyData()
            chatTV.scrollToBottom()
        call_Chat()
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
       
//        self.chatArr = self.chatArr.sorted(by: { $0.msgId > $1.msgId })
        let chat = chatArr[indexPath.row]
        switch chat.chatCellType {
        case .recieved:
            guard let cell = chatTV.dequeueReusableCell(withIdentifier: "ChatRecievedCell") as? ChatRecievedCell else {
                return UITableViewCell()
            }
            cell.setupCell(chat: chat)
            return cell
            
        case .sent:
            guard let cell = chatTV.dequeueReusableCell(withIdentifier: "ChatSentCell") as? ChatSentCell else {
                return UITableViewCell()
            }
            cell.setupCell(chat: chat)
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
//        let chat = chatArr[indexPath.row]
//
//        switch chat.chatCellType {
//            case .recieved:
//            return UITableViewAutomaticDimension
//        case .sent:
//            return UITableViewAutomaticDimension
//        case .none:
//            return 10
//        }
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



import UIKit

extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            let section = self.numberOfSections
            if section > 0 {
                let row = self.numberOfRows(inSection: section - 1)
                if row > 0 {
                    self.scrollToRow(at: IndexPath(row: row - 1, section: section - 1), at: .bottom, animated: animated)
                }
            }
        })
    }
}

extension String {

    var trim: String {
    return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}



extension ViewController{
    func call_Chat(){
       
//        activityIndicator.show(animated: true)
//
//        let parameters:[String:Any] = ["ToUserID":" 1d5fdf51c9fcfe6eb4326461782f6032" ,
//                                       "page":"1"]
//
//        HttpClientApi.instance().makeAPICall(url:  PINGAPI.baseURL, params: parameters, header: nil, method: .POST, success: { (data, response, error) in
//            do{
//                if let data = data , let json = try JSONSerialization.jsonObject(with: data) as? NSDictionary{
//                    DispatchQueue.main.async (execute:{
//                        if let success = json.value(forKey: "success") as? Bool , success == true{
//
//                            print(json.value(forKey: "messages") as! NSArray)
//
//                    self.oldChatArray = json.value(forKey: "messages") as! NSArray
//
//                    for i in 0..<self.oldChatArray.count{
//
//                        let oldChat = self.oldChatArray![i] as! NSDictionary
//
//                        if (oldChat.value(forKey: "FromUserID") as! Int) == 1{
//                            self.chatArr.append(Chat(
//
//                                msgId: oldChat.value(forKey: "MsID") as! Int,
//                                id: oldChat.value(forKey: "FromUserID") as! Int,
//                                 fromName: (oldChat.value(forKey: "fullName") as? String) ?? "no name",
//                                 message: oldChat.value(forKey: "MsBody") as! String,
//                                 recievedOn: nil,
//                                 deliveredOn: nil,
//                                 sentOn: oldChat.value(forKey: "MsDate") as? String,
//                                 readOn: nil,
//                                 chatCellType: .sent))
//                        }
//                        else{
//                            self.chatArr.append(Chat(
//
//                            msgId: oldChat.value(forKey: "MsID") as! Int,
//                            id: oldChat.value(forKey: "FromUserID") as! Int,
//                             fromName: (oldChat.value(forKey: "fullName") as? String) ?? "no name",
//                             message: oldChat.value(forKey: "MsBody") as! String,
//                             recievedOn: nil,
//                             deliveredOn: nil,
//                             sentOn: oldChat.value(forKey: "MsDate") as? String,
//                             readOn: nil,
//                             chatCellType: .recieved))
//                        }
//
//
//                    }
////                            sorted(by: { $0.fileID > $1.fileID })
//
////                            self.chatArr =  Array(NSOrderedSet(array: self.chatArr)) as! [Chat]
//                            print(self.chatArr)
////                            self.chatTV.reloadData()
////                            self.chatTV.scrollToBottom()
//                        }else{
//                        }
//                    })
//                }
//            }
//            catch{
//                DispatchQueue.main.async (execute:{
//                })
//            }
//        }, failure: {(data, response, error) in
//            DispatchQueue.main.async (execute:{
//
//            })
//        })
    }

}
