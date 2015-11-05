//
//  ZipcodeViewController.swift
//  Forecaster
//
//  Created by Isaiah Khan on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class ZipcodeViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate
{
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var findCityLabel: UIButton!
    @IBOutlet weak var currentLocationButton: UIButton!
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var delegate: ZipcodeViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        zipcodeTextField.becomeFirstResponder()
        currentLocationButton.enabled = false

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipcodeTextField.text != nil && validateZipCode(zipcodeTextField.text!)
        {
            rc = true
            search(zipcodeTextField.text!)
        }
        
        return rc
    }

    
    
    func validateZipCode(zipCode: String) -> Bool
    {
        var rc = false
        
        //let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if zipcodeTextField.text != "" && zipcodeTextField.text!.characters.count == 5
        {
            rc = true
        }
        else
        {
            zipcodeTextField.text = ""
            zipcodeTextField.placeholder = "Enter ZipCode"
        }
        return rc

    }
    //MARK: CLLocation related methods (functions)
    
    func configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
        {
            locationManager.delegate = self
            // once the location manager recieves updates, it tells our class that we are in now to update itself.
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            //we are telling the location manager to update every 100 meters.
            
            //if statement allows the currentLocationButton is enabled once everything is authorized.
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
            {
                locationManager.requestWhenInUseAuthorization()
            }
            else
            {
                currentLocationButton.enabled = true
            }
        }
    }
    
    // this function says that the user gave your app permission to use their location, and when they do, then you are enabling to use the Current Location Button in your popover view controller.
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            currentLocationButton.enabled = true
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])// function returns CLLlocationManager as a parameter, and an Array of CLLocations as its second parameter.
    {
        let location = locations.last
        // ".last pulls out the last update of your location in the last element of your array [CLLocations]
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
//geocoder is where you take lat & lng and convert it to an actual address, and reverse Geocode is when you get the address and convert it back to lat & lng.
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                let city = placemark?[0].locality
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                let aCity = Location(city: city!, lat: lat!, lng: lng!, weather: nil)
                self.delegate?.locationWasFound(aCity)
            }
        })
    }
    
    
    
    
    //MARK: Action Handlers
    @IBAction func findCity(sender: AnyObject)
    {
        if zipcodeTextField.text != nil && validateZipCode(zipcodeTextField.text!)
        {
            search(zipcodeTextField.text!)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func useLocationTapped(sender: UIButton)
    {
        locationManager.startUpdatingLocation()
        // Once user presses this button, then it starts updating where they are located on the map on your iphone screen.
    }
    
    
    
    
    
    
    
    
    
    func search(zip: String)
    {
        delegate!.zipWasChosen(zip)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
