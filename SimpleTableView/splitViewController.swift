//
//  splitViewController.swift
//  wellness
//
//  Created by Anna Jo McMahon on 2/23/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

import Foundation

class splitViewController :UISplitViewController {

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		
		splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.PrimaryOverlay
	
		return true
	}

	
	



}