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
    private let single_id = Expression<Int64>("id")
    private let path_id   = Expression<Int64>("path_id")
    private let longitude = Expression<Double>("longitude")
    private let latitude  = Expression<Double>("latitude")
    
    private init()
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do
        {
            db = try Connection("\(path)/MyDB.sqlite3")
        }
        catch
        {
            db = nil
            print ("Impossibile aprire database")
        }

    }
    
    func createTable()
    {
        do
        {
            try db!.run(percorsi.create(ifNotExists : true)
            {
                table
                in
                table.column(id,primaryKey:true)
                table.column(data)
                table.column(tempoTot)
                table.column(kmTot)
                print("Tabella Percorsi creata")
            })
            
            try db!.run(singoli.create(ifNotExists : true)
            {
                table
                in
                table.column(single_id,primaryKey:true)
                
                table.column(longitude)
                table.column(latitude)
                print("Tabella Singoli creata")
            })
        }
        catch
        {
            print("Impossibile creare tabelle")
        }
    }
    
    func addPercorso(cdata: Date, ctempoTot:Double, ckmTot:Double) -> Int64
    {
        do
        {
            let insert = percorsi.insert(data <- cdata, tempoTot <- ctempoTot, kmTot <- ckmTot)
            
            let id = try db!.run(insert)
            
            return id
        }
        catch
        {
            print ("Insert fallito")
            return -1
        }
    }
    
    func getPercorsi() -> [Percorso]
    {
        var percorsi = [Percorso]()
        
        do{
            for percorso in try db!.prepare(self.percorsi)
            {
                percorsi.append(Percorso(id:percorso[id], data: percorso[data]!, tempoTot: percorso[tempoTot]!, kmTot: percorso[kmTot]!))
            }
        }
        catch
        {
            print("Select fallito")
        }
        
        return percorsi
        
    }
    
    func deleteContact(cid: Int64) -> Bool
    {
        do
        {
            let percorso = percorsi.filter(id == cid)
            try db!.run(percorso.delete())
            return true
        }
        catch
        {
            print ("Delete fallito")
            return false
        }
    }
    
}
