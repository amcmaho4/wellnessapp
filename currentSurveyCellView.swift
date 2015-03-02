//
//  UITableViewCellCurrent.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/2/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import Foundation

import UIKit

import AVFoundation

class currentSurveyCellView: UITableViewCell{
	
	@IBOutlet var surveyName: UILabel!
	
	@IBOutlet var countDown: UILabel!
	
	@IBOutlet var progressBar: UIProgressView!
	
	@IBOutlet var submitButton: UIButton!
	
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(surveyName: String, countDown: NSDate, progressBar: UIProgressView){
		super.init()
		self.surveyName.text = surveyName
		self.countDown == countDown
		self.progressBar == progressBar
	}
	
	override init(){
		super.init()
	}
	func setUpCurrentCell(surveyName: String, countDown: NSDate, progressBar: UIProgressView) {
		self.surveyName.text = surveyName
		self.countDown == countDown
		self.progressBar == progressBar
	
	}

	
	
}
