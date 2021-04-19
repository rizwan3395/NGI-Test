//
//  AppLabelRegular.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import Foundation
import UIKit

class AppLabelRegular: UILabel {
    
    @IBInspectable var fontSize: CGFloat = 15
    @IBInspectable var fontColor: UIColor = .black
  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        self.font =  UIFont.systemFont(ofSize: fontSize)//UIFont(name: "Font name here", size: fontSize)
        self.textColor = fontColor
    }
}
