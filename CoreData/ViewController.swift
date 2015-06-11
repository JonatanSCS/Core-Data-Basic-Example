//
//  ViewController.swift
//  CoreData
//
//  Created by Jonatan Santa Cruz Soria on 07/06/15.
//  Copyright (c) 2015 Jonatan Santa Cruz Soria. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet var textUsername: UITextField!
    @IBOutlet var textPassword: UITextField!
    
    @IBAction func btnSave(sender: AnyObject) {
        var appDel:AppDelegate = {UIApplication.sharedApplication().delegate as! AppDelegate}()
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        var newUser: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        newUser.setValue(textUsername.text, forKey: "username")
        newUser.setValue(textPassword.text, forKey: "password")
        context.save(nil)
        println(newUser)
        
    }
    
     
    @IBAction func btnLoad(sender: AnyObject) {
        var appDel:AppDelegate = {UIApplication.sharedApplication().delegate as! AppDelegate}()
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        /*
        if results.count > 0 {
            
            for results in results {
                println(results)
            }
        }
        else {
            println("0 Results")
        }

*/
        println(results)
    }

    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextScene = segue.destinationViewController as! TableViewController
        
       
            var nuevoID = results
            nextScene.tableTshirt = nuevoID!
            
    }

    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

