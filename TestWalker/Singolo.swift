//
//  Singolo.swift
//  TestWalker
//
//  Created by Ospite on 24/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import Foundation

class Singolo
{
    
    let id: Int64?

    var latitude: Double
    var longitude: Double
    
    init(id:Int64)
    {
        self.id = id
        latitude = 0.0
        longitude = 0.0
    }
    
    init(id: Int64, latitude: Double, longitude: Double)
    {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
}
