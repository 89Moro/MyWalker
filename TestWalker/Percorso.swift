//
//  Percorso.swift
//  TestWalker
//
//  Created by Ospite on 24/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import Foundation

class Percorso {
    
    let id: Int64?
    
    var data: Date
    var tempoTot: Double
    var kmTot: Double
    
    init(id:Int64){
        self.id = id
        
        data = Date()
        tempoTot = 0.0
        kmTot = 0.0
    }
    
    init(id: Int64, data: Date, tempoTot: Double, kmTot: Double)
    {
        self.id = id
        self.data = data
        self.tempoTot = tempoTot
        self.kmTot = kmTot
    }
    
    
}
