//
//  CitiesTableTableViewController.swift
//  Forecaster
//
//  Created by Isaiah Khan on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

//NSCoding Constants
let kCityKey = "city"


protocol ZipcodeViewControllerDelegate
{
    func zipWasChosen(x: String)
    func locationWasFound(aLocation: Location)
}
protocol APIControllerDelegate
{
    func didReceiveAPIResults(arrayResults: NSArray)
}
protocol DarkSkyAPIControllerDelegate
{
    func didReceiveDarkSkyAPIResults(dictCurrently: NSDictionary, searchedForLocation: Location)
}


class CitiesTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate,ZipcodeViewControllerDelegate, APIControllerDelegate, DarkSkyAPIControllerDelegate
{

    var apiController: APIController!
    var locations = [Location]()
    
    //we are assigning APIController "OBJECT" to apiController, and it has a bang because there is no value attached to it yet.
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        apiController = APIController(delegate: self)
        
        // can't use self except inside a function
        //delegate is no longer empty, it is attached to self, which is this "CitiesTableViewController"
        //remember that this delegate means that its working on the behalf of another class, so in this project its delegating from class APIController.

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return locations.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityInfoCell", forIndexPath: indexPath) as! CityInfoCell
        
        let location = locations[indexPath.row]
        cell.cityLabel.text = location.city
        
        if location.weather != nil
        {
            cell.degreesLabel.text = String(location.weather!.temperature)
            cell.conditionsLabel.text = location.weather!.summary
        }
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ZipcodeSegue"
        {
            let popoverVC = segue.destinationViewController as! ZipcodeViewController
            popoverVC.popoverPresentationController?.delegate = self
            popoverVC.delegate = self
            popoverVC.preferredContentSize = CGSizeMake(200.0, 150.0)
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //MARK: - ZipcodeViewControllerDelegate
    
    
    func zipWasChosen(x: String)
    {
        apiController.useZipForCity(x)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func locationWasFound(aLocation: Location)
    {
        self.locations.append(aLocation)
        self.tableView.reloadData()
        
        let darkSkyAPI = DarkSkyAPIController(delegate: self)
        darkSkyAPI.useCityForWeather(aLocation)
    }
    
    //MARK: - API Controller Delegate
    func didReceiveAPIResults(arrayResults: NSArray)
    {
        //print(arrayResults)
        dispatch_async(dispatch_get_main_queue(),
        {
            let searchedForLocation = Location.locationWithJSON(arrayResults)
            
            self.locations.append(searchedForLocation)
            self.tableView.reloadData()
            
            let darkSkyAPI = DarkSkyAPIController(delegate: self)
            darkSkyAPI.useCityForWeather(searchedForLocation)
        })
    }
    //MARK: - DarkSkyAPIController Delegate
    func didReceiveDarkSkyAPIResults(dictCurrently: NSDictionary, searchedForLocation: Location)
    {
        dispatch_async(dispatch_get_main_queue(),
        {
            let searchedForWeather = Weather.weatherWithJSON(dictCurrently)
            
            for eachLocation in self.locations
            {
                if eachLocation.city == searchedForLocation.city
                {
                    eachLocation.weather = searchedForWeather
                }
            }
            
            self.tableView.reloadData()
            
        })

    }
    
    
    
    //MARK: -UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
    }
    
    //MARK: - Misc.
    func saveCityData()
    {
        let cityData = NSKeyedArchiver.archivedDataWithRootObject(Location)
        NSUserDefaults.standardUserDefaults().setObject(cityData, forKey: kCityKey)
    }
    
    func loadCityData()
    {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kCityKey) as? NSData
        {
            if let savedCity = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Location]
            {
                locations = savedCity
                tableView.reloadData()
            }
        }
    }

    
    
    
    
    func getWeatherData (urlString: String)
    {
        
    }


}
