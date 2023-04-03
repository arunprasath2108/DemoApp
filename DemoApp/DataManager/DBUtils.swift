//
//  DBUtils.swift
//  DemoApp
//
//  Created by arun-pt6232 on 16/03/23.
//

import Foundation

class DBUtils {
    
    func createTables() {
        createUserInfoTable()
    }
    
    private func createUserInfoTable() {
        let tableName = DBConstant.USERINFO_TABLE
        let columns = [
            DBConstant.USER_ID + " " +  DBConstant.INTEGER + " " +  DBConstant.PRIMARY_KEY,
            DBConstant.USER_NAME + " " +  DBConstant.TEXT + " " +  DBConstant.NOT_NULL,
            DBConstant.EMAIL_ID + " " +  DBConstant.TEXT + " " +  DBConstant.UNIQUE + " " +  DBConstant.NOT_NULL,
            DBConstant.PASSWORD + " " +  DBConstant.TEXT + " " +  DBConstant.NOT_NULL
        ]
        
        if DBConnector.shared.createTable(tableName: tableName, column: columns) != true {
            print("Can't create UserInfo table")
        }
    }

    
}
