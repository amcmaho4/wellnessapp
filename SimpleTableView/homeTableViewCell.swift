//
//  homeTableViewCell.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/2/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import UIKit

class homeTableViewCell: UITableViewCell {

	@IBOutlet var timeLabel: UILabel!
	
	@IBOutlet var surveyLabel: UILabel!
	
	@IBOutlet var surveyProgressView: UIProgressView!
	
	let currentSurvey = Survey.self
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	

}
