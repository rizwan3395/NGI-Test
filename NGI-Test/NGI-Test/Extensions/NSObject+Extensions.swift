//
//  UIViewController+Extensions.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import Foundation

extension NSObject {
    static func nameOfClass() -> String {
        return NSStringFromClass(self as AnyClass).components(separatedBy: ".").last!
    }
    var className: String {
        return String(describing: type(of: self))
    }
}
