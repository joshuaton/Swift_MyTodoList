//
//  TodoManager.swift
//  FirstSwift
//
//  Created by ShaoJun on 15/10/24.
//  Copyright © 2015年 ShaoJun. All rights reserved.
//

import UIKit
import SQLite

var todoManager : TodoManager = TodoManager()

struct todo {
    var id : Int64 = 0
    var name = "Un-Named"
    var desc = "Un-described"
}

class TodoManager: NSObject {
    
    var db : Connection?
    let items = Table("items")
    let id = Expression<Int64>("id")
    let title = Expression<String>("title")
    let subTitle = Expression<String>("subtitle")
    
    override init(){
        super.init()
    
        do{
            db = try Connection("\(Util.getDBPath())/db.sqlite3")
            
            try db!.run(items.create(ifNotExists: true) { t in
                t.column(id, primaryKey: true)
                t.column(title)
                t.column(subTitle)
            })
        }catch {
            NSLog("init error")
        }
    
    }
    
    func addTask(name: String, desc: String) -> Int64{
        
        let insert = items.insert(title <- name, subTitle <- desc)
        var rowid : Int64 = -1;
        do{
            rowid = try db!.run(insert)
        }catch{
            
        }
        return rowid
    }
    
    
    
    func queryAllTask() -> [todo]{
        var result = [todo]();
        for item in db!.prepare(items){
            result.append(todo(id: item[id], name: item[title], desc: item[subTitle]))
        }
        NSLog("queryAllTask result count:%d", result.count)
        return result
        
    }
    
    func getTaskCount() -> Int{
        return db!.scalar(items.count)
    }
    
    func deleteTask(index: Int){
        var result = queryAllTask()
        let id = result[index].id
        
        let alice = items.filter(id == rowid)
        
        do{
            try db!.run(alice.delete())
        }catch{
            
        }

    }
    
    
}


