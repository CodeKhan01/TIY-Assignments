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
    //MARK: CLLocation related methods
    
    func configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
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
    
    // this function says that the user gave you permission to use their location, and when they do then you are enabling to use the Current Location Button in your popover view controller.
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
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        // ".last pulls out the last update of your location in the last element of your array.
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                let cityName = placemark?[0].locality
                let zipCode = placemark?[0].postalCode
                self.zipcodeTextField.text = zipCode!
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                //let aCity = Location(name: cityName!, zip: zipCode!, lat: lat!, lng: lng!)
                //self.delegate?.cityWasFound(aCity), cityWasFound is a bens function, you have to put your function there.
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
