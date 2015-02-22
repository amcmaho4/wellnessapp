//
//  dailyAlerts.swift
//  UIAlertDemo
//
//  Created by Anna Jo McMahon on 2/17/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class dailyAlerts: UIViewController {
	
	
	var Timestamp: String {
		get {
			return "\(NSDate().timeIntervalSince1970 * 1000)"
		}
	}
	
		
		override func viewDidLoad() {
			super.viewDidLoad()
			// Do any additional setup after loading the view, typically from a nib.
			var localNotification:UILocalNotification = UILocalNotification()
			localNotification.alertAction = "test"
			localNotification.alertBody = "HELLO"
			localNotification.fireDate = NSDate(timeIntervalSinceNow: 2)
			//localNotification.category = "INVITE_CATEGORY";
			//UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
			
		}

	
	@IBAction func showAlert(sender: AnyObject) {
		
		
		var localNotification:UILocalNotification = UILocalNotification()
		localNotification.alertAction = "test"
		localNotification.alertBody = "HELLO"
		localNotification.fireDate = NSDate(timeIntervalSinceNow: 2)
		
		
		
		let alertController = UIAlertController(title: nil, message: "Alert Did not load", preferredStyle: .ActionSheet)
		
		let cancelAction = UIAlertAction(title: Timestamp, style: .Cancel) { (action) in
			// ...
		}
		
		alertController.addAction(cancelAction)
		
		let destroyAction = UIAlertAction(title: "F YOU ALERT", style: .Destructive) { (action) in
			println(action)
		}
		alertController.addAction(destroyAction)
		
		self.presentViewController(alertController, animated: true) {
			// ...
		}
	}
	
	
	
	
	@IBAction func showAlertss() {
		let alertController = UIAlertController(title: "Last chance to take the survey", message: "What do you want to do?", preferredStyle: .Alert)
		
		let callAction = UIAlertAction(title: "delete survey", style: .Default, handler: {
			action in
		
			}
		)
		alertController.addAction(callAction)
		
		let defaultAction = UIAlertAction(title: "go to survey", style: .Default, handler: nil)
		alertController.addAction(defaultAction)
		
		presentViewController(alertController, animated: true, completion: nil)
	}
	// double currentTime = CACurrentMediaTime();
}



	func checkForNewAlerts(){
	}







