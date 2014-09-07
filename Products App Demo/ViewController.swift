//
//  ViewController.swift
//  Products App Demo
//
//  Created by Victor  Adu on 9/2/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var product = [Product]()
    
    
    //Create a path to JSONData and configure it
    func createProductJSONPath() -> [Product]{
        let jsonProductDataPath = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("products", ofType: "json")!) //this creates a path bundle to our  'products.json'
        var parsedJSONProductData = NSJSONSerialization.JSONObjectWithData(jsonProductDataPath, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary //converts JSONData to foundation objects
        
        var myProduct = parsedJSONProductData.objectForKey("stores") as NSArray //We then grab our object values in our JSONData and store them in 'myProduct'
        
        //passed 'myProduct' into my class function 'createProductJSONPath'
        return Product.createProductJSONPath(myProduct)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.product = createProductJSONPath()
        
       // self.createProductJSONPath()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
 
        
    //MARK: UITableViewDataSource Methods
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    
    //return self.product.prdt1.count
        return product.count ///
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductListCell", forIndexPath: indexPath) as CustomTableCell
        
        var rowData = product[indexPath.row]
        
        cell.nameLabel.text = rowData.prodt_name
        cell.descLabel.text = rowData.prodt_description
        cell.idLabel.text = "\(rowData.prodt_id!)"
        cell.regPriceLabel.text = "\(rowData.reg_price!)"  // Passed 'Int reg_price" using the string literal "\()"
        //cell.salesPriceLabel.text = "\(rowData.sales_price)"
        
        //Setting photo for our tableView cell
        cell.imageView.image = rowData.prodt_photo
        
        //Setting our a catch with the 'if-else' statements below to catch any input product without image.
        if rowData.prodt_photo == nil {
            cell.imageView.image = UIImage(named: "Organic_Placeholder")
        }else {
            cell.imageView.image = rowData.prodt_photo  //How do I get the image to load from JSON...???
        }
        
                
        return cell
    }
    
    //Allows us to reorder cell rows
    func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    
    //From UITABLEVIEWDELEGATE: Responsible for appearance and interactions with Tableview cells
    
    //Function deselect highlighted cells when we return to them
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
     
        println("Touched Keyboard")
    }
    
    
    //Creating delete and Edit Action
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        // don't need anything here, just implement to make it work
    }
    
    func tableView(tableView: UITableView!, editActionsForRowAtIndexPath indexPath: NSIndexPath!) -> [AnyObject]! {
        // create a delete action
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete") {
            (action, indexPath) in
            // implement the delete changes
//            if let reminderRow = self.fetchedResultsController.fetchedObjects[indexPath.row] as? Reminder {
//                self.myContext.deleteObject(reminderRow)
//                self.myContext.save(nil)
 //           }
        }
        
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Edit Reminder") { (action:UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
//            if let reminderRow = self.fetchedResultsController.fetchedObjects[indexPath.row] as? Reminder {
//                self.indexPath = indexPath
//                self.performSegueWithIdentifier("editReminderDetails", sender: self)    ///
      //      }
        }
        //We could add 'moreAction' tabs if we want...
        //        let moreAction = UITableViewRowAction(style: .Default, title: "More") { (action, indexPath) -> Void in
        //            println("More Action Tapped")
        //        }
        
        // set the background color for the action button
        deleteAction.backgroundColor = UIColor.redColor()
        editAction.backgroundColor = UIColor.lightGrayColor()
        //moreAction.backgroundColor = UIColor.lightGrayColor()
        
        // return an array of actions
        return [deleteAction, editAction]
    }

    
    //MARK: PrepareForSegue Method
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "ShowDetails"{
        
            let destinationVC = segue.destinationViewController as DetailViewController
            
            var segPath = product[tableView.indexPathForSelectedRow().row]
            destinationVC.product = segPath
            
            println("Prepare Segue Fired")
        
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

