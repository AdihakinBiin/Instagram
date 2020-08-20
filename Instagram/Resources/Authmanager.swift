//
//  Authmanager.swift
//  Instagram
//
//  Created by ABDIHAKIN ELMI on 17/08/20.
//  Copyright © 2020 ABDIHAKIN ELMI. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    //MARK: - public
    
    public func registernewUser(username:String, email: String, password: String, completion: @escaping (Bool) -> Void){
        /*
         check if username if available
         check if email is available
         create account
         insert account to database
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 create account
                 insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        return
                    }
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            //success
                           completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                    }
            }
            } else {
                 //either username or email does not exist
                completion(false)
            }
    }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        if let email = email {
            //email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    
                    //firebase auth could not create account
                    completion(false)
                    
                    return
            }
                completion(true)
            }
        } else if username == username {
            //username login
            print(username)
        } else {
            //either username or email does not exist
            completion(false)
        }
    }

}
