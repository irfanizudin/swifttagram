//
//  ProfileViewController.swift
//  Swiftagram
//
//  Created by Irfan Izudin on 04/05/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavbar()
    }
    
    private func configureNavbar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingButton))
        navigationItem.title = "Profile"
    }
    
    @objc private func didTapSettingButton(){
        let vc = SettingViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
