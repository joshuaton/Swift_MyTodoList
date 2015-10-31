//
//  Util.swift
//  TodoList
//
//  Created by ShaoJun on 15/10/31.
//  Copyright © 2015年 ShaoJun. All rights reserved.
//

import UIKit

class Util: NSObject {
    static func getDBPath() -> String{
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first
        
        return path!
    }
}
