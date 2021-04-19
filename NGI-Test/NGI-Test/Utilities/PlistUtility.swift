//
//  PlistUtility.swift
//  NGI-Test
//
//  Created by muhammad on 19/04/2021.
//

import Foundation

struct FileTypes {
    static let Plist                                = "plist"
    static let Html                                 = "html"
}

struct FileNames {
    static let categoryDetail                   = "CategoryDetail"
}

class PlistUtility: NSObject {

    class func getDashboardPlistData()->[Any]{
        return getContentOfFile(name: FileNames.categoryDetail)
    }

    class  func getContentOfFile(name: String, fileType:String = FileTypes.Plist)->[Any]{
        if let path = Bundle.main.path(forResource:name , ofType: fileType) {
            //If your plist contain root as Array
            if let array = NSArray(contentsOfFile: path) as? [Any] {
                return array as [Any]
            }
        }
        return []
    }
}

