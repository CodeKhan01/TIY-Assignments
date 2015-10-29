//
//  ViewController.swift
//  MuttCutts
//
//  Created by Ben Gohlke on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol PopoverViewControllerDelegate
{
    func citiesWereFound(cities: [String])
}

class MapViewController: UIViewController, UIPopoverPresentationControllerDelegate, PopoverViewControllerDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    
    var citiesArray = Array<MKPointAnnotation>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

//        
//        let orlandoLocation = CLLocation(coordinate: tiyOrlando, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
//        let tampaLocation = CLLocation(coordinate: tiyTampa, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
    
//        let lineOfSightDistance = orlandoLocation.distanceFromLocation(tampaLocation)
//        print("distance between \(tiyOrlandoAnnotation.subtitle!) and \(tiyTampaAnnotation.subtitle!): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "CityStatePopoverSegue"
        {
            let popoverVC = segue.destinationViewController as! PopoverViewController
            popoverVC.popoverPresentationController?.delegate = self
            popoverVC.delegate = self
            popoverVC.preferredContentSize = CGSizeMake(200.0 , 180.0)

        }
    }
    
    
    //MARK: -UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
       return UIModalPresentationStyle.None
    }

    //MARK: - Delegate
    func citiesWereFound(cities: [String])
    {
        for city in cities
        {
            geoSearch(city)
        }
        print("loop ended");
        
        navigationController?.dismissViewControllerAnimated(true, completion:nil)
    }
    
    func geoSearch(city: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = city
                self.citiesArray.append(annotation)
                self.mapView.addAnnotations(self.citiesArray)
                
                print("\(city)")
                
                if self.citiesArray.count == 2
                {
                    let firstDistance = CLLocation(coordinate: self.citiesArray[0].coordinate, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
                    
                    
                    let secondDistance = CLLocation(coordinate: self.citiesArray[1].coordinate, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
                    
                    let lineOfSightDistance = firstDistance.distanceFromLocation(secondDistance)
                    
                    print("distance between \(firstDistance) and \(secondDistance): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
                    self.mapView.showAnnotations(self.citiesArray, animated: true)
                }
            }
            
        })
        //print(citiesArray)

    }
    
    
}

