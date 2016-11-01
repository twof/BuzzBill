//
//  RepProfileVC.swift
//  BuzzBill
//
//  Created by William Wold on 10/31/16.
//  Copyright © 2016 twof. All rights reserved.
//

import UIKit

class RepProfileVC: UIViewController {
	
	var rep: RepModel?
	
	@IBOutlet weak var nameLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
	}
	
	func setRep(repIn: RepModel) {
		rep=repIn
		nameLabel?.text="aaaaa"
	}
}
