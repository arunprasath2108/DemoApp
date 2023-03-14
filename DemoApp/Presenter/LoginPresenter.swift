//
//  LoginPresenter.swift
//  DemoApp
//
//  Created by arun-pt6232 on 13/03/23.
//

import Foundation

class LoginPresenter {
    
    func isUserPresent(username: String, password: String) -> Bool {
        //check username and mail id for username
        if username == "arun" {
            if password == "123" {
                return true
            }
        }
        
        return false
    }
}
