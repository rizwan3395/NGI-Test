//
//  Dictionary+Extensions.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import Foundation

extension Dictionary where Key == String {
    func valueInStringOf(key: String) -> String {
        return ( self[key] as? String ) ?? ""
    }
    func valueInIntOf(key: String) -> Int? {
        return self[key] as? Int
    }
    func valueInBoolOf(key: String) -> Bool? {
        return ( (self[key] as? Int ) ?? 0 ) == 1
    }
}
