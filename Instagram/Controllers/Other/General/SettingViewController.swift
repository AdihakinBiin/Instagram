//
//  SettingViewController.swift
//  InstagramClon
//
//  Created by ABDIHAKIN ELMI on 17/08/20.
//  Copyright © 2020 ABDIHAKIN ELMI. All rights reserved.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

/// View controller to show user setting
class SettingViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private func  configureModels() {
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTabLogOut()
            }
        ]
        data.append(section)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    private func didTabLogOut(){
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log Out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { success in
                     if success {
                         // present log in
                         let LoginVC = LoginViewController()
                         LoginVC.modalPresentationStyle = .fullScreen
                        self.present(LoginVC, animated: true){
                             self.navigationController?.popToRootViewController(animated: false)
                             self.tabBarController?.selectedIndex = 0
                         }
                     } else {
                         // error occured
                         fatalError("Could not log out User")
                     }
                 }
        }))
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds

     present(actionSheet, animated: true)
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // handle cell selection here
        
        data[indexPath.section][indexPath.row].handler()
    }
}
