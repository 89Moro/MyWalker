//
//  ViewController.swift
//  TestWalker
//
//  Created by Ospite on 23/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SQLite
//bum bum
class ViewController: UIViewController,MKMapViewDelegate
{
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var mvMap: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mvMap.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations : [CLLocation])
    {
        let currentLat = (manager.location?.coordinate.latitude)
        let currentLon = (manager.location?.coordinate.longitude)
        
        let newCoordinate = CLLocation(latitude : currentLat!,longitude: currentLon! ).coordinate
        
        
    }


}

