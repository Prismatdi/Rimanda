//
//  SettingsViewController.swift
//  Rimanda
//
//  Created by leonardo mappa on 29/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate, ClickableTextFieldDelegate {

	@IBOutlet weak var txtCalendar: ClickableTextField!
	@IBOutlet weak var txtIndirizzoServer: UITextField!
	@IBOutlet weak var txtUsername: UITextField!
	@IBOutlet weak var txtPassword: UITextField!
	@IBOutlet weak var txtMesi: UITextField!
	@IBOutlet weak var txtTimeout: UITextField!
	var firma: NSArray?
	var textFieldAttivo : UITextField!
	var calendario: String = ""
	
	override func viewWillAppear(_ animated: Bool) {
		
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		txtCalendar.ctfDelegate = self
		txtCalendar.delegate = self
		txtMesi.delegate = self
		txtTimeout.delegate = self
		txtUsername.delegate = self
		txtPassword.delegate = self
		txtIndirizzoServer.delegate = self
		txtIndirizzoServer.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyPathServer)
		txtUsername.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyUtente)
		txtPassword.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyPassword)
		txtMesi.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyMesi)
		txtCalendar.text  = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyCalendario)
		
		txtTimeout.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyTimeout)
		if let mytxt = txtIndirizzoServer!.text{
			
			if (mytxt.isEmpty){
				txtIndirizzoServer.text = "http://81.21.29.236:8080/RAPPORTINI_WEB/services/rapportini/"
			}
		}

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	
	
	@IBAction func btnSalva(_ sender: UIButton) {
		UserDefaults.standard.setValue(txtIndirizzoServer.text, forKey: KeyForUserDefaults.keyPathServer)
		UserDefaults.standard.setValue(txtUsername.text, forKey: KeyForUserDefaults.keyUtente)
		UserDefaults.standard.setValue(txtPassword.text, forKey: KeyForUserDefaults.keyPassword)
		UserDefaults.standard.setValue(txtTimeout.text ,forKey: KeyForUserDefaults.keyTimeout)
		UserDefaults.standard.setValue(txtMesi.text ,forKey: KeyForUserDefaults.keyMesi)
		UserDefaults.standard.setValue(txtCalendar.text ,forKey: KeyForUserDefaults.keyCalendario)
		if let myFirma = firma {
			let myData:Data  = NSKeyedArchiver.archivedData(withRootObject: myFirma)
			UserDefaults.standard.setValue(myData, forKey: KeyForUserDefaults.keyFirma)
		}
		
		
		UserDefaults.standard.synchronize()
		let _ = self.navigationController?.popViewController(animated: true)
		
		
	}
	
	@IBAction func btnFirma(_ sender: UIButton) {
		UserDefaults.standard.setValue(txtIndirizzoServer.text, forKey: KeyForUserDefaults.keyPathServer)
		UserDefaults.standard.setValue(txtUsername.text, forKey: KeyForUserDefaults.keyUtente)
		UserDefaults.standard.setValue(txtPassword.text, forKey: KeyForUserDefaults.keyPassword)
		UserDefaults.standard.setValue(txtTimeout.text ,forKey: KeyForUserDefaults.keyTimeout)
		UserDefaults.standard.setValue(txtMesi.text ,forKey: KeyForUserDefaults.keyMesi)
		UserDefaults.standard.setValue(txtCalendar.text ,forKey: KeyForUserDefaults.keyCalendario)

		UserDefaults.standard.synchronize()
	}
	
	
	@IBAction func unwindToViewController(segue: UIStoryboardSegue) {
		let vc = segue.source as! FirmaTecnicoViewController
		let firma = vc.firmaView.lines
		self.firma = firma as NSArray?
	}
	
	@IBAction func unwindToCalendar(segue: UIStoryboardSegue) {
		let vc = segue.source as! CalendarTableViewController
		txtCalendar.text = vc.calendarName
		
	}

	func buttonPressed(_ sender: UITextField) {
		textFieldAttivo = sender
		if (sender === txtCalendar){
			performSegue(withIdentifier: "showCalendar", sender: self)
		}
		
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textFieldDidEndEditing(textField)
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		
		textField.resignFirstResponder()
		textFieldAttivo = nil
	}
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	

}
