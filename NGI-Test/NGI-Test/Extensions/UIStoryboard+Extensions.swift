//
//  UIStoryboard+Extensions.swift
//  NGI-Test
//
//  Created by muhammad on 19/04/2021.
//

import UIKit

extension UIStoryboard {
    convenience init(storyBoard: StoryboardName, bundle: Bundle? = nil) {
        self.init(name: storyBoard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<ViewController: UIViewController>() -> ViewController {
        guard let viewController = instantiateViewController(withIdentifier: ViewController.identifier) as? ViewController else {
            fatalError("Couldn't instantiate viewController with identifier \(ViewController.identifier)")
        }
        return viewController
    }
}
