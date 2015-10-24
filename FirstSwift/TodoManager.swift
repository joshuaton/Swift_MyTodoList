//
//  TodoManager.swift
//  FirstSwift
//
//  Created by ShaoJun on 15/10/24.
//  Copyright © 2015年 ShaoJun. All rights reserved.
//

import UIKit

var todoManager : TodoManager = TodoManager()

struct todo {
    var name = "Un-Named"
    var desc = "Un-described"
}

class TodoManager: NSObject {
    var todos = [todo]()
    
    func addTask(name: String, desc: String){
        todos.append(todo(name: name, desc: desc))
    }
}


