//
//  DetailViewController.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var tableView:CategoryDetailTableView!
    
    var selectedCategory:Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let sItem = selectedCategory else {return}
        tableView.reloadWithData(selectedItem: sItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = selectedCategory?.name
        leftBackBtn()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
