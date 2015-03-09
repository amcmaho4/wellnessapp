//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Andrei Puni on 25/12/14.
//  Copyright (c) 2014 Andrei Puni. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
	//@IBOutlet weak var questionBox: UITextField!
	
	@IBOutlet weak var questionBox: UILabel!
	@IBOutlet weak var nextButton: UIButton!
	@IBOutlet weak var lastButton: UIButton!
	@IBOutlet weak var questionsProgress: UIProgressView!
	
	@IBOutlet var finishButton: UIButton!
	
	
	var Timestamp: Double {
		get {
			return (NSDate().timeIntervalSince1970 * 1000)
		}
	}
	var items: [String] = ["1 - Not at all", "2 - Very Little", "3 - Somewhat", "4 - quite a bit", "5 - Not at all", "Yes", "No"]
	
	//var items: [String] = ["😎", "😬", "😑", "😠", "😡"]
	
	let questions: [String] = ["Angry or Irritated","Stressed or Overwhelmed", "anxious", "happy"]
	var ans = [Int](count: 4, repeatedValue: -1)
	var timeStamps = [Double](count: 4, repeatedValue: -1)
	var currentQuestion=0;

	override func viewDidLoad() {
        super.viewDidLoad()
		finishButton.enabled = false
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUI:", name: "COUNTER_UPDATED", object: nil)
		
		
    }
	
//	func drawAShape(notification:NSNotification){
//		var view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
//		view.backgroundColor = UIColor.redColor()
//		
//		self.view.addSubview(view)
//		
//	}
//	
//	func showAMessage(notification:NSNotification){
//		var message:UIAlertController = UIAlertController(title: "A Notification Message", message: "Hello there", preferredStyle: UIAlertControllerStyle.Alert)
//		message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//		
//		self.presentViewController(message, animated: true, completion: nil)
//		
//	}

	
	
	@IBAction func nextAction(sender: UIButton) {
		questionBox.text = questions[++currentQuestion]
		lastButton.enabled=true
		println(questions.count)
		println(currentQuestion)
		if(currentQuestion==questions.count-1)
		{
			nextButton.enabled=false
			finishButton.enabled=true;
		}
		
		setTableCellStates()
		setProgress()
		
	}
	
	@IBAction func lastAction(sender: AnyObject) {
		questionBox.text = questions[--currentQuestion];
		
		nextButton.enabled=true
		if(currentQuestion==0)
		{
			lastButton.enabled=false;
		}
		
		setTableCellStates()
		
	}
	
	func setProgress(){
		var i: Float=0.0
		for number in ans {
			if(number>=0){
				i++
			}
		}
		var progress = i / (Float)(ans.count)
		
		questionsProgress.setProgress(progress, animated: true)
	
	}
	func numberOfSections() -> Int{
	return 1
	}
	
	func setTableCellStates(){
		if(ans[currentQuestion] >= 0){
			var index = NSIndexPath(forRow: ans[currentQuestion], inSection: 0)
			var selectedIndex = self.tableView.indexPathForSelectedRow()
			
			
			if(selectedIndex != nil){
				
			tableView.deselectRowAtIndexPath(selectedIndex!, animated: false)
			}
			tableView.selectRowAtIndexPath(index, animated: false, scrollPosition: UITableViewScrollPosition.None)
			
		}
		else {
			let selectedIndex = self.tableView.indexPathForSelectedRow()
			tableView.deselectRowAtIndexPath(selectedIndex!, animated: false)
		}
	
	}
	
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
	
//	func tableView(tableView: UITableView, setT )
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
		if indexPath == 0{
		
		}
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
	
	
	
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		var n = currentQuestion
		
		ans[n] = indexPath.row
		timeStamps[n] = Timestamp;
		
	}
	
	func setHeightOfTableView()
	{
	
	/**** set frame size of tableview according to number of cells ****/
//	var height=60.0*self.items.count;
	//tableView.setFrame
	
		
	}
	
	
	@IBAction func finishAction(sender: UIButton) {
		
		var moodData = PFObject(className:"mood")
		var surveyData = PFObject(className:"surveyData")
		
		surveyData["userHasTakenSurvey"] = true
				
		for a in 0...3{
			moodData["Q\(a)"] = [ans[a], timeStamps[a]]
		}
		
		surveyData.saveInBackgroundWithBlock({ (success: Bool!, error: NSError!) -> Void in
			// saved now
		})
		
		moodData.saveInBackgroundWithBlock({ (success: Bool!, error: NSError!) -> Void in
			// saved now
		})
		
		
		
		
		var result = " \(ans[0]) , \(ans[1]) , \(ans[2]) , \(ans[3])";
		let data = result.dataUsingEncoding(NSUTF8StringEncoding)
		let file = PFFile(name:"responses.csv", data:data)
		var textFile = PFObject(className:"textFile")
		textFile["Name"] = UIDevice.currentDevice().identifierForVendor.UUIDString
		textFile["Responses"] = file
		textFile.saveInBackgroundWithBlock({ (success: Bool!, error: NSError!) -> Void in
			// saved now
		})
		
		println(result);
		//createFileAtPath
	}
	
	


}


