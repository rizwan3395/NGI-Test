//
//  BaseViewController.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = getTitle()
        showNavBar()

    }
    
    func showNavBar(){
        setFont()
        navigationController?.isNavigationBarHidden = false
        UINavigationBar.appearance().barTintColor = .red
        navigationController?.navigationBar.backgroundColor = getBarBackgroundColor()
    }
    
    func hideNavBar(){
        navigationController?.isNavigationBarHidden = true
    }
    
    func showNavBarWithOutBackground(){
        setFont()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func setFont(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Font Name Here", size: 20) ?? UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor:getBarTintColor()]
    }
    
    func leftMenuBtn(){
        let rightBtn = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(openMenu))
        self.navigationItem.leftBarButtonItem = rightBtn
    }
    
    func leftBackBtn(){
        let rightBtn = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnPressed))
        self.navigationItem.leftBarButtonItem = rightBtn
    }
    
    @objc func openMenu() {
        print("Open Side Menu")
    }
    
    @objc func backBtnPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func getTitle()->String{
        var className = ""
        var titleName = ""
        
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.contains(self) {
                className = self.className
            }else {
                className = (navigationController.viewControllers.first?.className)!
            }
            
            if let title = NavigationTitle(rawValue: className) {
                titleName = title.value
            }
        }
        return titleName
    }
    
    func getBarBackgroundColor()->UIColor{
        var className = ""
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.contains(self) {
                className = self.className
            }else {
                className = (navigationController.viewControllers.first?.className)!
            }
            print(className)
            if let title = NavigationBarColor(rawValue: className) {
                return title.value
            }
        }
        return .white
    }
    
    func getBarTintColor()->UIColor{
        var className = ""
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.contains(self) {
                className = self.className
            }else {
                className = (navigationController.viewControllers.first?.className)!
            }
            print(className)
            if let title = NavigationBarTintColor(rawValue: className) {
                return title.value
            }
        }
        return .white
    }
}
