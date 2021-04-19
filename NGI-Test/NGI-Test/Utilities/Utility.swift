//
//  Category.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit


class Utility: NSObject {
    
    class func loadJson(filename fileName: String) -> [[String: Any]]
    {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json")
        {
            if let data = NSData(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let object = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
                    if let dictionary = object as? [[String: Any]] {
                        return dictionary
                    }
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            print("Error!! Unable to load  \(fileName).json")
        }
        return []
    }
}
