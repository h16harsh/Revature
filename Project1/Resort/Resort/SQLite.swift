//
//  SQLite.swift
//  Resort
//
//  Created by admin on 4/30/21.
//

import Foundation
import SQLite3

class SQLite{
    var db : OpaquePointer?
    var starList = [DBHelper]()
    
    init(){
        let fileP = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("starDB.sqlite")
       
        
        if sqlite3_open(fileP.path, &db) != SQLITE_OK{

            print("can not open DB")
        }
        
        if sqlite3_exec(db, "create table if not exists sta (starnum integer primary key, star text)", nil,nil,nil) != SQLITE_OK {
            let err = String(cString : sqlite3_errmsg(db)!)
            print("error is ",err)
        }
        
    }
    
    func saveData(r:String) {
         
        let star = r
        
        var stmt: OpaquePointer?
        
        let query = "INSERT INTO sta (star) VALUES (?)"
        
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString : sqlite3_errmsg(db)!)
            print("query error is ",err)
        }
        print(star)
        
        if sqlite3_bind_text(stmt, 1, star , -1, nil) != SQLITE_OK{
            let err = String(cString : sqlite3_errmsg(db)!)
            print("bind error is ",err)
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let err = String(cString : sqlite3_errmsg(db)!)
            print(" insert error is ",err)
            return
        }
        
        print("data saved")
     }
    
}
