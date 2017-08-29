//
//  MonitorInterventiViewController.swift
//  Rimanda
//
//  Created by leonardo mappa on 06/03/17.
//  Copyright © 2017 leonardo mappa. All rights reserved.
//

import UIKit
import EventKit


class MonitorInterventiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var lblUtente: UILabelX!

	@IBOutlet weak var lblMese: UILabelX!
	
	@IBOutlet weak var tableCalendar: UITableView!
	var calendars: [EKCalendar]?
	 var cale: EKCalendar!
	 var events: [EKEvent]?
	var firstDay = Date()
	var lastDay = Date()

	var daDataD : String = ""
	var aDataY : String = ""
	var aDataM : String = ""
	var aDataD : String = ""
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableCalendar.delegate = self
		tableCalendar.dataSource = self
        // Do any additional setup after loading the view.
    }
	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		

		
		fetchEventsFromCalendar(calendarTitle: UserDefaults.standard.string(forKey: KeyForUserDefaults.keyCalendario)!)
		
		
		let dateFormatter: DateFormatter = DateFormatter()

		let calendar = Calendar.current
		lblUtente.text =  UserDefaults.standard.string(forKey: KeyForUserDefaults.keyUtente)
		
		// Set calendar and date
		
		let date = calendar.date(byAdding: DateComponents(day: -10), to: Date())!
		
		// Get first day of month
		let firstDayComponents = calendar.dateComponents([.year, .month], from: date)
		firstDay = calendar.date(from: firstDayComponents)!
		
		// Get last day of month
		let lastDayComponents = DateComponents(month: 1, day: -1)
		lastDay = calendar.date(byAdding: lastDayComponents, to: firstDay)!
		
		// Set date formatter
		
		dateFormatter.locale = Locale(identifier: "it-IT")
		dateFormatter.dateFormat = "yyyy-MM-dd"
//		dateFormatter.dateStyle = .full
//		dateFormatter.timeStyle = .medium
		
		// Print results
		print(dateFormatter.string(from: date)) // Prints: 22 March 2017 at 18:07:15 CET
		print(dateFormatter.string(from: firstDay)) // Prints: 1 March 2017 at 00:00:00 CET
		print(dateFormatter.string(from: lastDay)) // Prints: 31 March 2017 at 00:00:00 CEST
		
		let pdata = dateFormatter.string(from: firstDay)
		let ldata = dateFormatter.string(from: lastDay)

		var componentsDa = (calendar as NSCalendar).components([.year,.month, .day ], from: date)
		componentsDa.day = 1
		
		
		dateFormatter.locale = Locale(identifier: "it-IT")
		
		let month = dateFormatter.monthSymbols[componentsDa.month! - 1]
		lblMese.text = month
		lblMese.text = lblMese.text?.uppercased()
		
		let eventStore = EKEventStore()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let startDate = dateFormatter.date(from: pdata)
		let endDate = dateFormatter.date(from: ldata)
		
		if let startDate = startDate, let endDate = endDate {
			let eventsPredicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: [cale])
		
		self.events = eventStore.events(matching: eventsPredicate).sorted {
			(e1: EKEvent, e2: EKEvent) in
			
			return e1.startDate.compare(e2.startDate) == ComparisonResult.orderedAscending
			}
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let events = events {
			return events.count
		}
		
		return 0
	}
	
	
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//        print("cellForRowAtIndexPath")
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		cell.textLabel?.text = events?[(indexPath as NSIndexPath).row].title
		cell.detailTextLabel?.text = formatDate(events?[(indexPath as NSIndexPath).row].startDate)
		
		
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		
	}
	
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if (indexPath.row % 2 == 0)
		{
			cell.backgroundColor = UIColor.white
		} else {
			cell.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
		}
	}
	
	
	func fetchEventsFromCalendar(calendarTitle: String) -> Void {
		self.calendars = EKEventStore().calendars(for: EKEntityType.event).sorted() { (cal1, cal2) -> Bool in
			return cal1.title < cal2.title
		}
		
		for calendar:EKCalendar in calendars! {
			
			if calendar.title == calendarTitle {
				
				cale = calendar
				
			}
		}
 }
	
	
	func formatDate(_ date: Date?) -> String {
		if let date = date {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "dd/MM/yyyy"
			return dateFormatter.string(from: date)
		}
		
		return ""
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
