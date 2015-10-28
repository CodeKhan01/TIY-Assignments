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
        override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Lakeland, FL", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = "Lakeland, FL"
                self.mapView.addAnnotation(annotation)
            }
        })
    }
        
//        let tiyOrlando = CLLocationCoordinate2DMake(28.540923, -81.38216)
//        let tiyOrlandoAnnotation = MKPointAnnotation()
//        tiyOrlandoAnnotation.coordinate = tiyOrlando
//        tiyOrlandoAnnotation.title = "The Iron Yard"
//        tiyOrlandoAnnotation.subtitle = "Orlando"
//        
//        let tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642)
//        let tiyTampaAnnotation = MKPointAnnotation()
//        tiyTampaAnnotation.coordinate = tiyTampa
//        tiyTampaAnnotation.title = "The Iron Yard"
//        tiyTampaAnnotation.subtitle = "Tampa"
//        
//        let annotations = [tiyOrlandoAnnotation, tiyTampaAnnotation]
//        mapView.addAnnotations(annotations)
//        mapView.showAnnotations(annotations, animated: true)
//        mapView.camera.altitude *= 2
//        
////        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
////        mapView.setRegion(viewRegion, animated: true)
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
        navigationController?.dismissViewControllerAnimated(true, completion:nil)
        
    }
}

