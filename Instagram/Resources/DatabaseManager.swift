//
//  DatabaseManager.swift
//  Instagram
//
//  Created by ABDIHAKIN ELMI on 17/08/20.
//  Copyright © 2020 ABDIHAKIN ELMI. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    let database = Database.database().reference()
    
    //MARK: - public
    ///check if username and email is available
    /// -parameter
    /// email: String representing email
    /// username: String representing username
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    //inserts new user to the database
       // - parameter
       // - email: String representing email
       // - username: String representing username
     // - async callback for result if database is succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        
        database.child(email.safedatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
            
        }
        
    }
 
}
