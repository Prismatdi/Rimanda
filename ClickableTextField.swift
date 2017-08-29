//
//  ClickableTextField.swift
//  OdiniS
//
//  Created by Angelo Vittorio Zapponi on 25/12/15.
//  Copyright © 2015 Angelo Vittorio Zapponi. All rights reserved.
//

import UIKit
protocol ClickableTextFieldDelegate{
    func buttonPressed(_ sender: UITextField)
}
class ClickableTextField: UITextField {
    @IBInspectable var nomeImmagine: String = ""
    @IBInspectable var sizeBottone: CGSize = CGSize(width: 17, height: 17)
    var ctfDelegate: ClickableTextFieldDelegate?
    func clearClicked(_ sender:UIButton)
    {
        if let _ = ctfDelegate{
            ctfDelegate?.buttonPressed(self)
        }
    }
    
    override func awakeFromNib() {
        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: sizeBottone.width, height: sizeBottone.height))
        clearButton.setImage(UIImage(named: nomeImmagine)!, for: UIControlState())
        
        self.rightView = clearButton
        clearButton.addTarget(self, action: #selector(ClickableTextField.clearClicked(_:)), for: UIControlEvents.touchUpInside)
        
        self.clearButtonMode = UITextFieldViewMode.never
        self.rightViewMode = UITextFieldViewMode.always
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
