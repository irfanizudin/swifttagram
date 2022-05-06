//
//  ExploreViewController.swift
//  Swiftagram
//
//  Created by Irfan Izudin on 04/05/22.
//

import UIKit

class ExploreViewController: UIViewController {

    private let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
    }
    
}
