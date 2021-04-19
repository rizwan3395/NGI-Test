//
//  AppWhiteButton.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import Foundation
import UIKit

class AppWhiteButton: UIButton {
        
    @IBInspectable var fontSize: CGFloat = 17
    @IBInspectable var _backgroundColor: UIColor = .white
    @IBInspectable var _textColor: UIColor = .darkGray
    @IBInspectable var _cornerRadius: CGFloat = 0
    @IBInspectable var _borderColor: UIColor = .darkGray
    @IBInspectable var _borderWidth: CGFloat = 1.0

    
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

