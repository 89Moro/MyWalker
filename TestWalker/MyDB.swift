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
    
    private let percorsi = Table("percorsi")
    private let id       = Expression<Int64>("id")
    private let data     = Expression<Date?>("data")
    private let tempoTot = Expression<Double?>("tempo_tot")
    private let kmTot    = Expression<Double?>("km_tot")
    
    private let singoli   = Table("singoli")
    private let path_id   = Expression<Int64>("id")
    private let longitude = Expression<Double>("longitude")
    private let latitude  = Expression<Double>("latitude")
    
    private init()
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/MyDB.sqlite3")
        }
        catch
        {
            db = nil
            print ("Impossibile aprire database")
        }

    }
}
