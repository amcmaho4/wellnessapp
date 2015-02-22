//
//  sliderTableViewController.swift
//  SimpleTableView
import Foundation
import UIKit
import AVFoundation

class sliderTableViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource{
	
		@IBOutlet var tableView: UITableView?
//	var questions: NSArray = NSArray()
	var questions = ["Angry or Irritated","Stressed or Overwhelmed", "anxious", "happy"]
	
		let applicationDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate

		override func viewDidLoad() {
			super.viewDidLoad()
			
			
		}
		override func viewWillDisappear(animated: Bool) {
			super.viewWillDisappear(animated)
			//updateCoreData()
		}
		
		override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
			// Dispose of any resources that can be recreated.
		}
		
		override func viewWillAppear(animated: Bool) {
			super.viewWillAppear(animated)
			tableView?.reloadData()
		}
	
//	MARK: - Table View Data Source Methods
	// Asks the data source to return the number of sections in the table view
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	// Asks the data source to return the number of rows in a section, the number of which is given
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	
	//Prepare and Return a Table View Cell
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		if let cell = tableView.dequeueReusableCellWithIdentifier("answer") as sliderCellView? {
			// how to do this with if let???
			if questions.count>(indexPath.row){
				println("yes")
				cell.question.text = "\(questions[indexPath.row])"
			}

		cell.selectionStyle = UITableViewCellSelectionStyle.None // so you cannot select the rows
			return cell;
		} else {
			return sliderCellView();
		}
		

		
	}

	
	//MARK: - Table View Delegate Method
//	// Asks the table view delegate to return the height of a given row.
//	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//		if (indexPath.row == 4) {
//			return CGFloat(135.0)
//		} else {
//			return CGFloat(55.0)
//		}
//	}
//	
}