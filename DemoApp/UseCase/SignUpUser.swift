//
//  SignUpUser.swift
//  DemoApp
//
//  Created by arun-pt6232 on 17/03/23.
//

import Foundation

class SignUpUser {

    let dataBase = UserInfoDBController()
    
    func userSignUp(emailID: String,userName: String, pass: String, success: @escaping(String) -> Void, failure: @escaping(String) -> Void) {
        
        DispatchQueue.global().async {
            self.dataBase.addUser(username: userName, emailID: emailID, password: pass) {
                responseMsg in
                
                success(responseMsg)
                
            } failure: { error in
                failure(error)
            }
        }
    }
}
