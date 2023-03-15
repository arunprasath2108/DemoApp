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
    
    private init() { }
    
    private var fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(component: "demoApp.sqlite")
    
    func openDatabase() {
        if sqlite3_open(fileURL.path(), &dbPointer) != SQLITE_OK {
            print("Can't create Database")
        }
        else {
            print("opened Database Successfully\(fileURL.path)")
        }
    }

    func closeDatabase() {
            
            if sqlite3_close(dbPointer) != SQLITE_OK {
                print("Error closing database")
            }
        }
    
}
