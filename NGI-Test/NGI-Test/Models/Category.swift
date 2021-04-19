//
//  Category.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import Foundation


class Category {
    var imageURL:String?
    var name:String?
    var detail:String?
    var price:String?
    var largeImageUrl:String?
    var longDescription:String?
    
    init(name:String?, detail:String?, imageUrl:String?) {
        self.name = name
        self.detail = detail
        self.imageURL = imageUrl
    }
    
    init(dict:[String:Any]) {
        self.name = dict.valueInStringOf(key: "name")
        self.detail = dict.valueInStringOf(key: "detail")
        self.imageURL = dict.valueInStringOf(key: "imageUrl")
        self.largeImageUrl = dict.valueInStringOf(key: "largeImageUrl")
        self.longDescription = dict.valueInStringOf(key: "longDescription")
        self.price = dict.valueInStringOf(key: "price")
    }
    
    class func AddSomeFields(numberOfItems:[[String:Any]]) -> [Category] {
        var items:[Category] = []
        for item in numberOfItems {
            items.append(Category.init(dict: item))
        }
        return items
    }
}
