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
	
	
	
	
	
	
	@IBOutlet var backView: UIView!
	
	@IBOutlet var signinbackView: UIView!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		//Looks for single or multiple taps.
		var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
		signinbackView.addGestureRecognizer(tap)
		
	}
	
	//Calls this function when the tap is recognized.
	func DismissKeyboard(){
		//Causes the view (or one of its embedded text fields) to resign the first responder status.
		signinbackView.endEditing(true)
	}

	
	
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
		self.performSegueWithIdentifier("signupSegue", sender: self)

		
	} else {
		let errorString = error.localizedDescription
		//println(errorString)
		// Show the errorString somewhere and let the user try again.
		println("NOT signed UP")
		self.showAlert(errorString)
	}
  }
		
		
		
	}
	
	
	func showAlert(error: NSString){
		var createAccountErrorAlert: UIAlertView = UIAlertView()
		
		createAccountErrorAlert.delegate = self
		createAccountErrorAlert.title = "Oops"
		createAccountErrorAlert.message = error
		createAccountErrorAlert.addButtonWithTitle("OK")
		createAccountErrorAlert.show()
	}
	
	
	
	func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
		
		switch buttonIndex{
			
		case 0:
			NSLog("Retry");
			break;
		default:
			NSLog("Default");
			break;
			//Some code here..
			
		}
	}
	
	
	
	
	
}
