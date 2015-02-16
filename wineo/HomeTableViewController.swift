//
//  HomeTableViewController.swift
//  wineo
//
//  Created by George Steele on 2/15/15.
//  Copyright (c) 2015 Ian Clark. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var years: Array <AnyObject> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
        let date = NSDate()
        let components = NSCalendar.currentCalendar().components(flags, fromDate: date)
        
        let year = components.year
        println(year)
        let month = components.month
        println(month)
        let day = components.day
        println(day)
        var yearStr=String(year)
        years = [yearStr]
        for var index = 1; index < 20; ++index{
            var newYear = year + index
            yearStr=String(newYear)
            years.append(yearStr)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.right    BarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return years.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?
        ) -> UITableViewCell {
      
        
        let CellId: String = "cellyear"
        
        var cell: UITableViewCell = tableView?.dequeueReusableCellWithIdentifier(CellId) as UITableViewCell
       
        if let ip = indexPath{
          cell.textLabel.text = years[ip.row] as? String
        }
        
        
        
        
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            if let tv = tableView {
                
            years.removeAtIndex(indexPath!.row)
            // Delete the row from the data source
            tv.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
