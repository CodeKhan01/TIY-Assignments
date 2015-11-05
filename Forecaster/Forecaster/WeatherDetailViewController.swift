//
//  WeatherDetailViewController.swift
//  Forecaster
//
//  Created by Isaiah Khan on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class WeatherDetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var degreesLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
 
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    
    

}
