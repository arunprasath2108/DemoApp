//
//  DBConnector.swift
//  DemoApp
//
//  Created by arun-pt6232 on 15/03/23.
//

import Foundation
import SQLite3

class DBConnector {
    
    static let shared = DBConnector()
    private var dbPointer: OpaquePointer?
    let dbUtils = DBUtils()
    private init() { }
    
    private var fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appending(component: "demoApp.sqlite")
    
    func openDatabase() {
        if sqlite3_open(fileURL.path(), &dbPointer) == SQLITE_OK {
            print("Opened Database Successfully \(fileURL.path)")
            dbUtils.createTables()
        }
        else {
            print("Can't create Database")
        }
    }
    
    
    func createTable(tableName: String, column: [String]) -> Bool {
        let columnsStr = column.joined(separator: ", ")
        let createQuery = "\(DBConstant.CREATE_TABLE_IF_NOT_EXISTS) \(tableName) (\(columnsStr))"
        print(createQuery)
        
        return execute(query: createQuery)
    }
    
    
    func execute(query: String) -> Bool {
        var statement: OpaquePointer?
        
        if sqlite3_prepare(dbPointer, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                return true
            }
        }
        return false
    }

    
    
    
    
    
    func closeDatabase() {
            if sqlite3_close(dbPointer) != SQLITE_OK {
                print("Error closing database")
            }
        }
    
}
