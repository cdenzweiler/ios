//
//  Enter.swift
//  ios
//
//  Created by Matthew on 3/2/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import UIKit

class Enter: UIView {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var viewIcon0: UIView!

    @IBOutlet weak var constraintHeightTextView0: NSLayoutConstraint!
    @IBOutlet weak var textViewIcon0: UITextView!
    @IBOutlet weak var imageViewIcon0: UIImageView!
    
    @IBOutlet weak var constraintHeightTextView1: NSLayoutConstraint!
    @IBOutlet weak var imageViewIcon1: UIImageView!
    @IBOutlet weak var textViewIcon1: UITextView!
    
    @IBOutlet weak var imageViewIcon2: UIImageView!
    
    @IBOutlet weak var textViewIcon2: UITextView!
    @IBOutlet weak var constraintHeightTextView2: NSLayoutConstraint!
    
    @IBOutlet weak var textViewIcon3: UITextView!
    @IBOutlet weak var constraintHeightTextView3: NSLayoutConstraint!
    
    @IBOutlet weak var textViewIcon4: UITextView!
    @IBOutlet weak var constraintHeightTextView4: NSLayoutConstraint!
    
    
    @IBOutlet weak var textViewIcon5: UITextView!
    @IBOutlet weak var constraintHeightTextView5: NSLayoutConstraint!
    
    class func instanceFromNib() -> Enter {
        return UINib(nibName: "Enter", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Enter
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
      super.willMove(toSuperview: newSuperview)
       let stringTitleMenu = "menu"
//       let stringContentMenu = " - contains your pending invitations, ongoing games, and historic endgame snapshots.\r" +
//                               "when you have an unseen invitation, or your opponent makes a new move " +
//                               "this menu icon will be colored "
        
        let stringContentMenu = " contains your pending invitations, ongoing games, and historic endgame snapshots."
        
             
        let textMenu = "\(stringTitleMenu)\(stringContentMenu)"
        let attrText = NSMutableAttributedString(string: textMenu)
        
        let fontTitle = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        let fontContent = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        
        let largeTextRange = (textMenu as NSString).range(of: stringTitleMenu)
        let smallTextRange = (textMenu as NSString).range(of: stringContentMenu)
        
        attrText.addAttribute(NSAttributedString.Key.font, value: fontTitle, range: largeTextRange)
        attrText.addAttribute(NSAttributedString.Key.font, value: fontContent, range: smallTextRange)
        attrText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: largeTextRange)
        attrText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: smallTextRange)
        
        //let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.magenta, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)]
        //let secondString = NSAttributedString(string: "magenta", attributes: secondAttributes)
        //attrText.append(secondString)
        
        //let secondAttributes0 = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)]
        //let secondString0 = NSAttributedString(string: " to draw your attention.", attributes: secondAttributes0)
        //attrText.append(secondString0)
       
        self.textViewIcon0.attributedText = attrText
        self.textViewIcon0.textContainer.lineBreakMode = .byCharWrapping
        
        self.textViewIcon0.sizeToFit()
        self.constraintHeightTextView0.constant = self.textViewIcon0.contentSize.height
       
        
    
        let attrText1 = NSMutableAttributedString(string: "")
        let xxxx1 = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)]
        let xxxx0 = NSAttributedString(string: "config", attributes: xxxx1)
        attrText1.append(xxxx0)
        let zxxx1 = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)]
        let zxxx0 = NSAttributedString(string: " edit youur config... lalala", attributes: zxxx1)
        attrText1.append(zxxx0)
        self.textViewIcon1.attributedText = attrText1
        self.textViewIcon1.textContainer.lineBreakMode = .byCharWrapping
        self.textViewIcon1.sizeToFit()
        self.constraintHeightTextView1.constant = self.textViewIcon1.contentSize.height
        
        
        let attrText2 = NSMutableAttributedString(string: "")
        let xxxx2 = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)]
        let xxxx3 = NSAttributedString(string: "fairy", attributes: xxxx2)
        attrText2.append(xxxx3)
        let zxxx2 = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)]
        let zxxxV = NSAttributedString(string: " so interesting can  skj nfkj nfv lkjfwnf lkas ljds en you have an unseen invitation, or yo en you have an unseen invitation, or yo", attributes: zxxx2)
        attrText2.append(zxxxV)
        self.textViewIcon2.attributedText = attrText2
        self.textViewIcon2.textContainer.lineBreakMode = .byCharWrapping
        self.textViewIcon2.sizeToFit()
        self.constraintHeightTextView2.constant = self.textViewIcon2.contentSize.height
        
        
        let attrText3 = NSMutableAttributedString(string: "")
        let xxxxY = NSAttributedString(string: "challenge", attributes: xxxx2)
        attrText3.append(xxxxY)
        let zxxxF = NSAttributedString(string: " 589345985389 so interesting can  skj nfkj nfv lkjfwnf lkas ljds en you have an unseen invitation, or yo en you have an unseen invitation, or yo t6868956", attributes: zxxx2)
        attrText3.append(zxxxF)
        self.textViewIcon3.attributedText = attrText3
        self.textViewIcon3.textContainer.lineBreakMode = .byCharWrapping
        self.textViewIcon3.sizeToFit()
        self.constraintHeightTextView3.constant = self.textViewIcon3.contentSize.height
        
        let attrText4 = NSMutableAttributedString(string: "")
        let xxxxY0 = NSAttributedString(string: "quick play", attributes: xxxx2)
        attrText4.append(xxxxY0)
        let zxxxFx = NSAttributedString(string: " so interesting can  skj nfkj nfv lkjfwnf lkas ljds en you have an unseen invitation, or yo en you have an unseen invitation, or yo, or yo t6868956", attributes: zxxx2)
        attrText4.append(zxxxFx)
        self.textViewIcon4.attributedText = attrText4
        self.textViewIcon4.textContainer.lineBreakMode = .byCharWrapping
        self.textViewIcon4.sizeToFit()
        self.constraintHeightTextView4.constant = self.textViewIcon4.contentSize.height

        
        let attrText5 = NSMutableAttributedString(string: "")
        let xxxxY0a = NSAttributedString(string: "profile", attributes: xxxx2)
        attrText5.append(xxxxY0a)
        let zxxxFxf = NSAttributedString(string: " get there like this so do all the interesting stuuff...", attributes: zxxx2)
        attrText5.append(zxxxFxf)
        self.textViewIcon5.attributedText = attrText5
        self.textViewIcon5.textContainer.lineBreakMode = .byCharWrapping
        self.textViewIcon5.sizeToFit()
        self.constraintHeightTextView5.constant = self.textViewIcon5.contentSize.height
    }
    
}