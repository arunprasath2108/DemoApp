//
//  UserInfoDBController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 16/03/23.
//

import Foundation

class UserInfoDBController {
    
    
    func addUser(username: String, emailID: String, password: String, success: @escaping(String) -> Void, failure: @escaping (String) -> Void) {
        
        let tableName = DBConstant.USERINFO_TABLE
        let columns = [
            DBConstant.USER_NAME : username,
            DBConstant.EMAIL_ID : emailID,
            DBConstant.PASSWORD : password
        ]
        
        if !DBConnector.shared.insert(tableName: tableName, values: columns) {
            failure("Error in DB")
            return
        }
        success("Added")
        
    }
    
    
}
