//
//  57questionsViewController.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/8/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import UIKit

class _7questionsViewController: UIViewController{
	
	
	@IBOutlet var answerButtons: [UIView]!
		

	var items: [String] = ["1 - Not at all", "2 - Very Little", "3 - Somewhat", "4 - quite a bit", "5 - Not at all"]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let myFirstLabel = UILabel()
		let myFirstButton = UIButton()
		myFirstLabel.text = "I made a label on the screen #toogood4you"
		myFirstLabel.font = UIFont(name: "MarkerFelt-Thin", size: 45)
		myFirstLabel.textColor = UIColor.redColor()
		myFirstLabel.textAlignment = .Center
		myFirstLabel.numberOfLines = 5
		myFirstLabel.frame = CGRectMake(15, 54, 300, 500)
		myFirstButton.setTitle("✸", forState: .Normal)
		myFirstButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
		myFirstButton.frame = CGRectMake(15, -50, 300, 500)
		myFirstButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
		self.view.addSubview(myFirstLabel)
		self.view.addSubview(myFirstButton)
	}
	
	func pressed(sender: UIButton!) {
		var alertView = UIAlertView();
		alertView.addButtonWithTitle("Ok");
		alertView.title = "title";
		alertView.message = "message";
		alertView.show();
	}
	
	
}



