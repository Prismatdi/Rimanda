//
//  FirmaTecnicoViewController.swift
//  AppRapportini
//
//  Created by Angelo Vittorio Zapponi on 27/04/15.
//  Copyright (c) 2015 Angelo Vittorio Zapponi. All rights reserved.
//

import UIKit

class FirmaTecnicoViewController: UIViewController {
	
    
	@IBOutlet weak var firmaView: DrawView!
	
	
    var lines:[Line]?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myLines = lines{
            firmaView.lines = myLines
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	@IBAction func btnSalva(_ sender: UIButton) {
		 performSegue(withIdentifier: "unwindToViewController", sender: self)
	}
	
	@IBAction func btnCancel(_ sender: UIButton) {
		firmaView.lines = []
		firmaView.setNeedsDisplay()
	}
	
	
	
	
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
    }
    */

}
