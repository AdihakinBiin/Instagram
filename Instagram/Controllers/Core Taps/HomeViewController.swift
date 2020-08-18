//
//  HomeViewController.swift
//  Instagram
//
//  Created by ABDIHAKIN ELMI on 17/08/20.
//  Copyright © 2020 ABDIHAKIN ELMI. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil {
            let LoginVC = LoginViewController()
            LoginVC.modalPresentationStyle = .fullScreen
            present(LoginVC, animated: false)
        }
    }


}
