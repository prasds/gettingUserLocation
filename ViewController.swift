//
//  ViewController.swift
//  gettingUserLocation
//
//  Created by Prashanth Ds on 07/07/16.
//  Copyright © 2016 Prashanth Ds. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var latitudeDisplay: UILabel!
    
    @IBOutlet weak var longitudeDisplay: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    
    
    @IBAction func resetLocationButton(sender: AnyObject) {
        
        print("reset button pressed")
        
        startLocation = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(CLLocationManager.locationServicesEnabled()){
            
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            
            print("location services enabled")
            
        }else{
            
            print("plesae enable location services")
        }
        
        startLocation = nil
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        print("entered locationManager update function")
        
        let lastestLocation = locations.last
        
        latitudeDisplay.text = String(lastestLocation!.coordinate.latitude)
        longitudeDisplay.text = String(lastestLocation!.coordinate.longitude)
        
        print("longitude : ", lastestLocation!.coordinate.longitude)
        print("latitude : ", lastestLocation!.coordinate.latitude)
        
        if startLocation == nil {
            
            startLocation = lastestLocation
        }
    }

    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print("locationManager error function")
        
        locationManager.stopUpdatingLocation()

        print ("something went wrong: \(error)")
        
    }

//    
//    func locationManager(manager: CLLocationManager!,
//                         didUpdateLocations locations: [AnyObject]!)
//    {
//        let latestLocation: AnyObject = locations[locations.count - 1]
//        
//        latitudeDisplay.text = String(format: "%.4f",
//                               latestLocation.coordinate.latitude)
//        longitudeDisplay.text = String(format: "%.4f",
//                                latestLocation.coordinate.longitude)
//        
//        if startLocation == nil {
//            startLocation = latestLocation as! CLLocation
//        }
//        
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

