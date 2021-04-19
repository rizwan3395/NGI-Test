//
//  CategoryDetailTableView.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit

class CategoryDetailTableView: UITableView {

    var viewArray = PlistUtility.getContentOfFile(name: FileNames.categoryDetail)
    var item:Category?
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        registerCells()
    }
    
    func registerCells(){
        for object in viewArray {
            let obj = object as! [String:Any]
            let cell = obj["cellIdentifier"] as! String
            self.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        }
    }
    
    func reloadWithData(selectedItem:Category) {
        item = selectedItem
        self.reloadData()
    }
}

extension CategoryDetailTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = viewArray[indexPath.row] as! [String:Any]
        let cell = self.dequeueReusableCell(withIdentifier: object["cellIdentifier"] as! String, for: indexPath) as! CategoryDetailTableViewCell
        cell.initliazeValues(item: item, perFields: object)
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let object = viewArray[indexPath.row] as! [String:Any]
        let cell = object["cellIdentifier"] as! String
        
        switch cell {
        case "CategoryDetailTableViewCell":
            return UIScreen.main.bounds.height*0.35
        case "TwoDDButtonTableViewCell","WhiteButtonTableViewCell":
            return UIScreen.main.bounds.height*0.1
        case "GreanButtonTableViewCell":
            return UIScreen.main.bounds.height*0.12
        default:
            return UITableView.automaticDimension
        }
        
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

extension CategoryDetailTableView:CDCellButtonsDelegate {
    func selectSizeBtn() {
        print("Size Button Pressed")
    }
    
    func selectQuantityBtn() {
        print("Qauntity Button Pressed")
    }
    
    func placeOrderBtnPressed() {
        print("Order Button Pressed")
    }
    
    func addFavouriteBtn() {
        print("Add Favourite Button Pressed")
    }
    
    
}
