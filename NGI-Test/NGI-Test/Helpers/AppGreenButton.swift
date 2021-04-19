//
//  AppGreenButton.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import Foundation
import UIKit

class AppGreenButton: UIButton {
        
    @IBInspectable var fontSize: CGFloat = 16
    @IBInspectable var _backgroundColor: UIColor = UIColor.app_GreenButton()
    @IBInspectable var _textColor: UIColor = UIColor.white
    @IBInspectable var _cornerRadius: CGFloat = 0
    @IBInspectable var _borderColor: UIColor = UIColor.clear
    @IBInspectable var _borderWidth: CGFloat = 0.0

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)//UIFont(name: "font name here", size: fontSize)
        self.setTitleColor(_textColor, for: .normal)
        self.backgroundColor = _backgroundColor
        layer.cornerRadius = _cornerRadius
        layer.borderColor = _borderColor.cgColor
        layer.borderWidth = _borderWidth
    }
    
}
