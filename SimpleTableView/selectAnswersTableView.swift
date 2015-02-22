//
//  selectAnswersTableView.swift
//  wellness
//
//  Created by Anna Jo McMahon on 2/22/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import Foundation
import UIKit

class selectAnswersTableView: UITableView {

	func numberOfSectionsInTableView(selectAnswersTableView: UITableView) -> Int {
		return 1
	}
	
	// Asks the data source to return the number of rows in a section, the number of which is given
	func tableView(selectAnswersTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	


}