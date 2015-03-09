//
//  homeTableViewController.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/2/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import UIKit
import Parse

class homeTableViewController: UITableViewController {

	//let surveysArray: [Survey]
	
		let surveys: [String] = ["survey1 name","survey2 name", "survey3 name", "survey4 name"]
	var User: PFUser?
	

    override func viewDidLoad() {
        super.viewDidLoad()
		var currentUser = PFUser.currentUser()
		if currentUser != nil {
			println("there is a  user")
		} else {
			println("no user")
			self.performSegueWithIdentifier("loginSegue", sender: self)
		}

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//		var currentUser = PFUser.currentUser()
//		if currentUser != nil {
//			// Do stuff with the user
//		} else {
//			self.performSegueWithIdentifier("loginSegue", sender: self)
//		}
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
		if(section == 0){
		return 1
		}
		else{
			return 2
		}
	
    }

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		if let cell = tableView.dequeueReusableCellWithIdentifier("cell") as homeTableViewCell? {
			// how to do this with if let???
			if surveys.count>(indexPath.row){
				cell.surveyLabel.text = "\(surveys[indexPath.row])"
			}
			if (indexPath.row != 0 || indexPath.section != 0) {
			cell.selectionStyle = UITableViewCellSelectionStyle.None // so you cannot select the rows
			}
			return cell;
		} else {
			return sliderCellView();
		}
    }
	/* section headers
	appear above each `UITableView` section */
	override func tableView(tableView: UITableView,
		titleForHeaderInSection section: Int)
		-> String {
			if (section == 0){
			return "Current Survey"
			}
			else if (section == 1){
			return "Future Surveys"
			}
			else {
			return "there isnt supposed to be a section here"
			}
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		if(indexPath.row == 0 && indexPath.section == 0){
			self.performSegueWithIdentifier("surveySelected", sender: self)
		}
		else{
				}
	}

	
	
	
	
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */


/*
	//USE THIS TO PASS SURVEY OBJECT
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
