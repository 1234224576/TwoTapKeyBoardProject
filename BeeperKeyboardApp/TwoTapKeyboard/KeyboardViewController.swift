//
//  KeyboardViewController.swift
//  TwoTapKeyboard
//
//  Created by 曽和修平 on 2015/10/13.
//  Copyright © 2015年 deeptoneworks. All rights reserved.
//

import UIKit

class KeyboardViewController:UIInputViewController,InputManagerDelegate{

    @IBOutlet var nextKeyboardButton: UIButton!
//    var tableView: UITableView!
    private var lexicon: UILexicon!
    
    var inputManager:InputManager = InputManager()
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var v = UINib(nibName:"Keyboard", bundle:nil).instantiateWithOwner(self,options:nil)[0] as! UIView
        self.inputView!.addSubview(v)
        
        
        self.inputManager.delegate = self
        
        
        
//        self.tableView = UITableView(frame: CGRectMake(50, 0, 300, 180))
//        tableView.dataSource = self
//        tableView.delegate = self
//        view.addSubview(tableView)
        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .System)
//    
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//    
//        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
//        
//        self.view.addSubview(self.nextKeyboardButton)
//    
//        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
//        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
//        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }

    @IBAction func a(sender: AnyObject) {
        self.inputManager.requestCandidatesForInput("にほん")
        if let input = textDocumentProxy as? UITextDocumentProxy {
            // 適当な文字入力
            input.insertText("日本")
            print("日本")
            
            // 文字入力ついでに用語集を取得
            requestSupplementaryLexiconWithCompletion({
                lexicon in
                for item in lexicon.entries {
                    self.lexicon = lexicon
//                    self.tableView.reloadData()
                    // 検索結果
                    print("documentText: \(item.documentText)")
                    // 検索結果とマッチしたユーザー入力値
                    print("userInput: \(item.userInput)")
                }
            })
        }
    }
    
    func inputManager(inputManager: InputManager!, didCompleteWithCandidates candidates: [AnyObject]!) {
        print(candidates)
        
        for c in candidates{
            print((c as! InputCandidate).candidate!)
        }
        
        
    }
    
    func inputManager(inputManager: InputManager!, didFailWithError error: NSError!) {
        print(error)
    }
    @IBAction func b(sender: AnyObject) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("い")
    }
    @IBOutlet weak var b: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
//            textColor = UIColor.whiteColor()
//        } else {
//            textColor = UIColor.blackColor()
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    // MARK: - UITableViewDataSource
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
//        if let entry: UILexiconEntry = lexicon.entries[indexPath.row] as? UILexiconEntry {
//            cell.textLabel?.text =  entry.documentText
//        }
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return lexicon != nil ? lexicon.entries.count : 0
//    }
//    
//    // MARK: - UITableViewDelegate
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        // タップしたアイテムの文字列を出力
//        if let entry: UILexiconEntry = lexicon.entries[indexPath.row] as? UILexiconEntry {
//            if let input = textDocumentProxy as? UITextDocumentProxy {
//                input.insertText(entry.documentText)
//            }
//        }
//    }

}
