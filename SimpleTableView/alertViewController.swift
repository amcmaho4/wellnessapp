//
//  alertViewController.swift
//  SimpleTableView
//
//  Created by Anna Jo McMahon on 2/21/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import Foundation

import UIKit

class alertViewController: UIViewController {
	


	
	func finalAlert() {
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







