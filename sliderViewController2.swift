//
//  sliderViewController2.swift
//  SimpleTableView
//
//  Created by Anna Jo McMahon on 2/15/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import Foundation
class sliderViewController2: UIViewController{

	@IBOutlet var slider: UISlider!
	
	@IBOutlet var sliderLabel2: UILabel!
	@IBOutlet var sliderLabel: UILabel!
	
	@IBOutlet var sliderLabel4: UILabel!
	@IBOutlet var sliderLabel3: UILabel!
	
	let questions: [String] = ["Angry or Irritated","Stressed or Overwhelmed", "anxious", "happy"]
	var ans = [Int](count: 4, repeatedValue: -1)
	var items: [String] = ["Not at all", "Very Little", "Somewhat", "quite a bit", "Extremely"]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		sliderLabel.text = questions[0]
		sliderLabel2.text = questions[1]
		sliderLabel3.text = questions[2]
		sliderLabel4.text = questions[3]

	}
	
	
	@IBAction func sliderMove(sender: UISlider) {
		
		ans[0]=Int(sender.value)
		sliderLabel.text = questions[0]+": "+items[Int(sender.value)]
	}
	
	
	@IBAction func slider2Move(sender: UISlider) {
		ans[1]=Int(sender.value)
		sliderLabel2.text = questions[1]+": "+items[Int(sender.value)]

	}

	@IBAction func slider3Move(sender: UISlider) {
		ans[2]=Int(sender.value)
	sliderLabel3.text = questions[2]+": "+items[Int(sender.value)]
	}
	
	@IBAction func slider4Move(sender: UISlider) {
		ans[3]=Int(sender.value)
	sliderLabel4.text = questions[3]+": "+items[Int(sender.value)]
	}
	
	@IBAction func submit(sender: UIButton) {
		var slidermoodData = PFObject(className:"slidermood")
		slidermoodData["questions"]=questions
	slidermoodData["answers"] = ans
		
	}

}