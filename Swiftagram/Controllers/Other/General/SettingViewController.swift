//
//  SettingViewController.swift
//  Swiftagram
//
//  Created by Irfan Izudin on 04/05/22.
//

import UIKit
import SafariServices

struct SettingCellModel{
    let title: String
    let handler: (() -> Void)
}

final class SettingViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModel()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModel(){
        data.append([
            SettingCellModel(title: "Edit Profile", handler: {
                [weak self] in self?.didTapEditProfile()
            }),
            SettingCellModel(title: "Invite Friends", handler: {
                [weak self] in self?.didTapInviteFriends()

            }),
            SettingCellModel(title: "Save Original Posts", handler: {
                [weak self] in self?.didTapSaveOriginalPosts()

            }),

        ])
        
        data.append([
            SettingCellModel(title: "Terms of Services", handler: {
                [weak self] in self?.openURL(type: .terms)

            }),
            SettingCellModel(title: "Privacy Policy", handler: {
                [weak self] in self?.openURL(type: .privacy)

            }),
            SettingCellModel(title: "Help and Feedback", handler: {
                [weak self] in self?.openURL(type: .help)

            }),
        ])
        
        data.append([
            SettingCellModel(title: "Log Out", handler: {
                [weak self] in self?.didTapLogOut()
            })
        ])

        
    }
    
    private func didTapEditProfile(){
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends(){
        print("Invite Friends")
    }
    
    private func didTapSaveOriginalPosts(){
        print("Save Original Posts")
    }
    
    enum SettingURLType{
        case terms, privacy, help
    }
    
    private func openURL(type: SettingURLType){
        let urlString: String
        switch type{
        case .terms: urlString = "https://help.instagram.com/581066165581870"
        case .privacy: urlString = "https://help.instagram.com/196883487377501"
        case .help: urlString = "https://help.instagram.com"
        }
        
        guard let url = URL(string: urlString) else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }

    
    private func didTapLogOut(){
        print("Logout")
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
