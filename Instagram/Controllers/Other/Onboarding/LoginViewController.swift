//
//  LoginViewController.swift
//  InstagramClon
//
//  Created by ABDIHAKIN ELMI on 17/08/20.
//  Copyright © 2020 ABDIHAKIN ELMI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
          return field
      }()
    
    private let loginButton: UIButton = {
          return UIButton()
      }()
    
    private let privacyButton: UIButton = {
            return UIButton()
        }()
    
    private let termsButton: UIButton = {
            return UIButton()
        }()
    
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
             return UIView()
         }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        //assign Frames
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        view.addSubview(createAccountButton)
    }
    
    @objc private func didTabLoginButton(){}
    @objc private func didTabTermsButton(){}
    @objc private func didTabPrivacyButton(){}
    @objc private func didTabCreatedAcountButton(){}
    
  

}
