//
//  TableViewController.swift
//  CoreData
//
//  Created by Jonatan Santa Cruz Soria on 07/06/15.
//  Copyright (c) 2015 Jonatan Santa Cruz Soria. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    
    var array = ["Hola", "Hola"]
    func get(){
    
    var appDel:AppDelegate = {UIApplication.sharedApplication().delegate as! AppDelegate}()
    var context:NSManagedObjectContext = appDel.managedObjectContext!
    var request = NSFetchRequest(entityName: "Users")
    request.returnsObjectsAsFaults = false
    var results:NSArray = context.executeFetchRequest(request, error: nil)!
        println(results)
        for res in results {
            var totalWorkTimeInHoursString = res.valueForKey("username") as! String
            array.append(totalWorkTimeInHoursString)
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return array.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let idCell: String = "Cell"
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(idCell) as! UITableViewCell
        cell.textLabel!.text = self.array[indexPath.row]
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        
        
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            array.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextScene = segue.destinationViewController as! GETViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow(){
            var nuevoID = self.array[indexPath.row]
            nextScene.tableTshirt = nuevoID!
        }
    }
*/
}
