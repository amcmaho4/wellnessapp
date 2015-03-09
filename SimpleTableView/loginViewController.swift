//
//  loginViewController.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/2/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

	

	@IBOutlet var usernameText: UITextField!
	
	
	@IBOutlet var passwordText: UITextField!
	
	@IBOutlet var loginButton: UIButton!
	
	@IBOutlet var createAccountButton: UIButton!
	@IBOutlet var backView: UIView!

	
	//text field should return
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		//Looks for single or multiple taps.
		var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
		backView.addGestureRecognizer(tap)
		
    }
	
	

	
	//Calls this function when the tap is recognized.
	func DismissKeyboard(){
		//Causes the view (or one of its embedded text fields) to resign the first responder status.
		backView.endEditing(true)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBAction func loginButtonAction(sender: UIButton) {
		
		
		PFUser.logInWithUsernameInBackground(usernameText.text, password:passwordText.text) {
			(user: PFUser!, error: NSError!) -> Void in
			if user != nil {
				self.performSegueWithIdentifier("completedLoginSegue", sender: self)
			} else {
				println("login failed")
				
				self.showAlert()
				
			}
		}
	}
	
	
	@IBAction func CreateAccountButtonAction(sender: UIButton) {
		
		
		
	}
	
	func showAlert(){
		var createAccountErrorAlert: UIAlertView = UIAlertView()
		
		createAccountErrorAlert.delegate = self
		
		createAccountErrorAlert.title = "Oops"
		createAccountErrorAlert.message = "That is not an account"
		createAccountErrorAlert.addButtonWithTitle("Create Account")
		createAccountErrorAlert.addButtonWithTitle("Dismiss")
		createAccountErrorAlert.show()
	}
	
	
	
	func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
		
		switch buttonIndex{
			
		case 1:
			NSLog("Retry");
			break;
		case 0:
			self.performSegueWithIdentifier("createAccountSegue", sender: self)
			break;
		default:
			NSLog("Default");
			break;
			//Some code here..
			
		}
	}
	

}
