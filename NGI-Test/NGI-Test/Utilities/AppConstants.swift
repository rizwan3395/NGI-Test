//
//  AppConstants.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit

enum NavigationTitle: String {
    case MainViewController = "MainViewController"
    case DetailViewController = "DetailViewController"
    var value: String {
        switch self {
        case .MainViewController: return "Menu"
        case .DetailViewController: return "Details"
        }
    }
}

enum NavigationBarColor: String {
    case MainViewController = "MainViewController"
    case DetailViewController = "DetailViewController"
    var value: UIColor {
        switch self {
        case .MainViewController: return UIColor.clear
        case .DetailViewController: return UIColor.app_YellowishColor()
        }
    }
}

enum NavigationBarTintColor: String {
    case MainViewController = "MainViewController"
    case DetailViewController = "DetailViewController"
    var value: UIColor {
        switch self {
        case .MainViewController: return .black
        case .DetailViewController: return .white
        }
    }
}


enum StoryboardName: String {
    case main = "Main"
}
