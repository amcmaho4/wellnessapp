//
//  signinViewController.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/2/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import UIKit
class signinViewController: UIViewController {

	
	@IBOutlet var usernameText: UITextField!
	@IBOutlet var emailText: UITextField!
	
	@IBOutlet var passwordText: UITextField!
	
	
	
	@IBAction func createButtonAction(sender: UIButton) {
		
		var user = PFUser()
  		user.username = usernameText.text
 		 user.password = passwordText.text
  		user.email = emailText.text
  		// other fields can be set just like with PFObject
		//user["phone"] = "415-392-0202"
		
		user.signUpInBackgroundWithBlock {
		(succeeded: Bool!, error: NSError!) -> Void in
	if error == nil {
		println("signed UP")
	} else {
	//	let errorString = error.userInfo["error"] as NSString
		// Show the errorString somewhere and let the user try again.
		println("NOT signed UP")
	}
  }
		
		
		
	}
	
	
}
