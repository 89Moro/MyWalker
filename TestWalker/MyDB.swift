//
//  MyDB.swift
//  TestWalker
//
//  Created by Ospite on 24/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import Foundation
import SQLite

class MyDB
{
    static let instance = MyDB()
    
    private let db: Connection?
    
    private let contacts = Table("contacts")
    private let id       = Expression<Int64>("id")
    private let data     = Expression<Date?>("id")
    private let tempoTot = Expression<Double?>("cognome")
    private let kmTot    = Expression<Double?>("telefono")
    
    private init()
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/MyDB.sqlite3")
        }
        catch
        {
            db = nil
            print ("impossibile aprire database")
        }

    }
}
