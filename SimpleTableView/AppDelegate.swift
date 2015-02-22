//
//  AppDelegate.swift
//  SimpleTableView
//
//  Created by Andrei Puni on 25/12/14.
//  Copyright (c) 2014 Andrei Puni. All rights reserved.
//

import Foundation
import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	var pushNotificationController:PushNotificationController?

	var dict_info: NSMutableDictionary = NSMutableDictionary()
	

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		
		
		
		registerForParse()
		
		let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
		
		let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
		
		application.registerUserNotificationSettings(mySettings)
		
		
		
	
	
		// PUSH NOTIFICTION STUFF
		self.pushNotificationController = PushNotificationController()
		
		// Register for Push Notitications, if running iOS 8
		if application.respondsToSelector("registerUserNotificationSettings:") {
			let types:UIUserNotificationType = (.Alert | .Badge | .Sound)
			let settings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
			application.registerUserNotificationSettings(settings)
			application.registerForRemoteNotifications()
			
		} else {
			// Register for Push Notifications before iOS 8
			application.registerForRemoteNotificationTypes(.Alert | .Badge | .Sound)
		}
		
		// When users indicate they are Giants fans, we subscribe them to that channel.
		let currentInstallation = PFInstallation.currentInstallation()
		currentInstallation.addUniqueObject("Giants", forKey: "channels")
		currentInstallation.saveInBackground()
		let subscribedChannels = PFInstallation.currentInstallation().channels
	return true
}
	
	
	func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
		println("didRegisterForRemoteNotificationsWithDeviceToken")
		let currentInstallation = PFInstallation.currentInstallation()
		currentInstallation.setDeviceTokenFromData(deviceToken)
		currentInstallation.saveInBackgroundWithBlock { (succeeded, e) -> Void in
			//code
		}
	}
	
	func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
		println("failed to register for remote notifications:  (error)")
	}
	
	func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
		println("didReceiveRemoteNotification")
		PFPush.handlePush(userInfo)
	}
	
	func application(application: UIApplication!,
		didRegisterUserNotificationSettings
		notificationSettings: UIUserNotificationSettings!){
			
			if notificationSettings.types == nil{
				/* The user did not allow us to send notifications */
				return
			}
			
			
			var timeForSurvey: NSDate?
			var query = PFQuery(className:"surveyTime")
			query.getObjectInBackgroundWithId("sY96fDXJ60") {
				(surveyTime: PFObject!, error: NSError!) -> Void in
				if error == nil {
					let updatedAt = surveyTime.updatedAt

					// check if the time has been changed
	
					if NSDate().timeIntervalSinceDate(updatedAt) < 60*60*24 {
					var timeForSurvey = NSDate(timeIntervalSinceNow: 4);//)//surveyTime["surveyTime"] as NSDate
					
					let notifications = [UILocalNotification(), UILocalNotification(), UILocalNotification()]
						var minutesBetweenSurveyNotifications: Int = 1;
						var minutesUntilNextSurveyNotification: Int = 0;
					for n in notifications{

						n.fireDate = timeForSurvey.xHoursMinutes(0, y: minutesUntilNextSurveyNotification)
						n.timeZone = NSCalendar.currentCalendar().timeZone
						
						n.alertBody = "You have a survey to take"
						n.repeatInterval = NSCalendarUnit.CalendarUnitDay
						/* Action settings */
						n.hasAction = true
						n.alertAction = "View"
					
						minutesUntilNextSurveyNotification += minutesBetweenSurveyNotifications
						application.scheduleLocalNotification(n)
					}

						
					}

				} else {
					NSLog("%@", error)
				}
			}

		
	}
	
	
func registerForParse(){
	
		// Override point for customization after application launch.
		Parse.setApplicationId("sU7ao7fKPWuy0B1jS7C2oekdD3ke1EXXmfeJELkW", clientKey: "18zl5F4VPSd6uHgdza0CYZproJssbneWcMC2pMOD")
		
		// set up moodData var, mood in parse
		var moodData = PFObject(className:"mood")
		// unique user Identifier
		moodData["User"] = UIDevice.currentDevice().identifierForVendor.UUIDString
		// start up the CS
		var textMoodData = PFObject(className:"textmood")
		
		let str = "Q1, Q2, Q3, Q4 "
		let data = str.dataUsingEncoding(NSUTF8StringEncoding)
		let file = PFFile(name:"responses.txt", data:data)
		textMoodData["User"] = UIDevice.currentDevice().identifierForVendor.UUIDString
		file.saveInBackgroundWithBlock({ (success: Bool!, error: NSError!) -> Void in
			// saved now
		})
	
	
	}

	
	
	
	
	
	
}
