//
//  selectAnswersTableView.swift
//  wellness
//
//  Created by Anna Jo McMahon on 2/22/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class selectAnswersTableView: UITableView, UITableViewDelegate, UITableViewDataSource{

	
	
	var items: [String] = ["1 - Not at all", "2 - Very Little", "3 - Somewhat", "4 - quite a bit", "5 - Not at all"]
	var questions = ["Angry or Irritated","Stressed or Overwhelmed", "anxious", "happy"]
	
	func numberOfSectionsInTableView(selectAnswersTableView: UITableView) -> Int {
		return 1
	}
	
	// Asks the data source to return the number of rows in a section, the number of which is given
	func tableView(selectAnswersTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if let cell: UITableViewCell  = tableView.dequeueReusableCellWithIdentifier("answer", forIndexPath: NSIndexPath()) as? UITableViewCell{
		
			
			if questions.count>(indexPath.row){
				println("yes")
//				cell.question?.text = "\(questions[indexPath.row])"
				cell.selectionStyle = UITableViewCellSelectionStyle.Blue
				return cell;
			}
		
		}
	
		return  UITableViewCell();
		
//			
//		if let cell = self.dequeueReusableCellWithIdentifier("answer")! as? sliderCellView {
//			 how to do this with if let???
//			if questions.count>(indexPath.row){
//				println("yes")
//				cell.question?.text = "\(questions[indexPath.row])"
//			}
//
//			cell.selectionStyle = UITableViewCellSelectionStyle.None // so you cannot select the rows
//			return cell;
//		} else {
//			return sliderCellView;
//		}
		
	}
	
	
	
	

}