//
//  LoginViewController.swift
//  Rimanda
//
//  Created by leonardo mappa on 27/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {

	@IBOutlet weak var txtUserName: UITextField!
	
	@IBOutlet weak var txtPassword: UITextField!
	
	@IBOutlet weak var btnLogin: UIButton!
	
	var textFieldAttivo : UITextField!
	
	override func viewWillAppear(_ animated: Bool) {
		//txtUserName.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyUtente)
//		if (txtUserName.text?.isEmpty)!{
//			performSegue(withIdentifier: "showSettings", sender:nil)
//		}
		//txtPassword.text = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyPassword)
	}
	
	override func awakeFromNib() {
		
		// MARK: - Setta formattazione e colori navigation bar
		
		self.navigationController?.navigationBar.barTintColor = UIColor(red:0.16, green:0.73, blue:0.61, alpha:1.0)
		
		self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)]
		self.navigationController?.navigationBar.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		txtUserName.delegate = self
		txtPassword.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.resignFirstResponder()
		textFieldAttivo = nil
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if (textField === txtUserName){
				txtUserName.resignFirstResponder()
		}
		if (textField === txtPassword){
			txtPassword.resignFirstResponder()
		}

		
		
		
		return true
	}

	@IBAction func btnSave(_ sender: UIButton) {
		
		let user = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyUtente)
		let pass = UserDefaults.standard.string(forKey: KeyForUserDefaults.keyPassword)
		
		if (txtUserName.text?.isEmpty)! {
			showMessage("Attenzione manca userName")
		}
		if (txtPassword.text?.isEmpty)! {
			showMessage("Attenzione manca Password")
		}
		
		if (txtUserName.text != user ){
			showMessage("User errato")
		}
		if (txtPassword.text != pass ){
			showMessage("password errata")
		}
		
		UserDefaults.standard.setValue(txtUserName.text, forKey: KeyForUserDefaults.keyUtente)
		UserDefaults.standard.setValue(txtPassword.text, forKey: KeyForUserDefaults.keyPassword)
		UserDefaults.standard.synchronize()
		performSegue(withIdentifier: "showMonitor", sender: self)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	func showMessage(_ message: String){
		
		let alertController = DOAlertController(title: "ATTENZIONE", message: message, preferredStyle: .alert)
		
		let OKAction = DOAlertAction(title: "OK", style: .default) { (action) in
			
			
			
		}
		
		// Add the action.
		alertController.addAction(OKAction)
		self.parent?.present(alertController, animated: true, completion: nil)
		
		
	}
}
