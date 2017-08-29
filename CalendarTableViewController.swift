//
//  CalendarTableViewController.swift
//  Rimanda
//
//  Created by leonardo mappa on 07/03/17.
//  Copyright © 2017 leonardo mappa. All rights reserved.
//

import UIKit
import EventKit


class CalendarTableViewController: UITableViewController {
var calendars: [EKCalendar]?
var calendarName: String?
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		checkCalendarAuthorizationStatus()
		self.tableView.backgroundColor = UIColor(red:0.00, green:0.40, blue:0.40, alpha:1.0)
		
    }
	override func viewWillAppear(_ animated: Bool) {
		checkCalendarAuthorizationStatus()
	}
	
	func checkCalendarAuthorizationStatus() {
		let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
		
		switch (status) {
		case EKAuthorizationStatus.notDetermined:
			// This happens on first-run
			requestAccessToCalendar()
		case EKAuthorizationStatus.authorized:
			// Things are in line with being able to show the calendars in the table view
			loadCalendars()
			refreshTableView()
		case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied: break
			// We need to help them give us permission
			//needPermissionView.fadeIn()
		}
	}
	
	func requestAccessToCalendar() {
		EKEventStore().requestAccess(to: .event, completion: {
			(accessGranted: Bool, error: Error?) in
			
			if accessGranted == true {
				DispatchQueue.main.async(execute: {
					self.loadCalendars()
					self.refreshTableView()
				})
			} else {
				DispatchQueue.main.async(execute: {
					//self.needPermissionView.fadeIn()
				})
			}
		})
	}
	
	func refreshTableView() {
		tableView.isHidden = false
		tableView.reloadData()
	}

	func loadCalendars() {
		self.calendars = EKEventStore().calendars(for: EKEntityType.event).sorted() { (cal1, cal2) -> Bool in
			return cal1.title < cal2.title
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
    // MARK: - Table view data source
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		calendarName = calendars?[(indexPath as NSIndexPath).row].title
		 performSegue(withIdentifier: "ritornoDaCalendar", sender: self)
		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		if let calendars = self.calendars {
			return calendars.count
		}
		
		return 0
	}
	
	
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		
		if let calendars = self.calendars {
			calendarName = calendars[(indexPath as NSIndexPath).row].title
			cell.textLabel?.text = calendarName
		} else {
			cell.textLabel?.text = "calendario sconosciuto"
		}
		
		return cell
	}

	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.backgroundColor = UIColor(red:0.00, green:0.40, blue:0.40, alpha:1.0)
		cell.textLabel?.textColor = UIColor.white
	}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

	
	
	
}


