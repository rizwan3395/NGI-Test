//
//  ViewController.swift
//  NGI-Test
//
//  Created by muhammad on 17/04/2021.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet weak var collectionView:MainVCCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavBarWithOutBackground()
        
        //Should be remove when implemented side menu
        leftMenuBtn()
    }
    
    func initializeValues(){
        collectionView.cellDelegate = self
        
        // API call should be implement here...
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.apiCall()
        })
    }
    
    func apiCall(){
        let json:[[String : Any]] = Utility.loadJson(filename: "CategoryJSON")
        collectionView.reloadWithData(array: Category.AddSomeFields(numberOfItems: json))
    }
}

extension MainViewController:MainVCCollectionCellDelegate {
    func selectedCategory(category: Category) {
        print("Item name is : \(category.name ?? "")")
        
        //Move to Details Screen
        let vc: DetailViewController = UIStoryboard(storyBoard:.main).instantiateViewController()
        vc.selectedCategory = category
        navigationController?.pushViewController(vc, animated: true)
    }
}

