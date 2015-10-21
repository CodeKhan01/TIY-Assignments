//
//  ToDoListTableViewController.swift
//  InDueTime
//
//  Created by Isaiah Khan on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController, UITextFieldDelegate
{
    
    //local declaration
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var tasks = Array<ToDoList>()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "To Do List"
        

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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return tasks.count
        //takes whatever is in the array of tasks, counts it, and displays each piece of the array in the cell if there is data.
        
    }

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoListCell", forIndexPath: indexPath) as! ToDoListCell
        
        // Configure the cell...
        let aSingleTask = tasks[indexPath.row]
        
        if aSingleTask.title == nil
        {
            cell.textField.becomeFirstResponder()
            
           
        }
        else
        {
            cell.textField.text = aSingleTask.title
        }
        
        return cell
    }
    
    //MARK: Action Handlers
    @IBAction func addButton(sender: UIButton)
    {
        let task = NSEntityDescription.insertNewObjectForEntityForName("ToDoList", inManagedObjectContext: managedObjectContext) as! ToDoList
        tasks.append(task)
        tableView.reloadData()
    }
    
    @IBAction func pressButton(sender:UIButton)
    {
        let contentView = sender.superview
        let cell = contentView?.superview as! ToDoListCell
        let indexPath = tableView.indexPathForCell(cell)
        let task = tasks[indexPath!.row]
        saveToDo()
    }
    
    
    
    
    //MARK - Private Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        if textField.text != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! ToDoListCell
            let indexPath = tableView.indexPathForCell(cell)
            let task = tasks[indexPath!.row]
            task.title = textField.text
            textField.resignFirstResponder()
            saveToDo()
            
        }
        return rc
    }
    
    func saveToDo()
    {
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            let nserror = error as NSError
            NSLog("NOT WORKING BRO \(nserror.userInfo)")
            abort()
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
