//
//  RepProfileVC.swift
//  BuzzBill
//
//  Created by William Wold on 10/31/16.
//  Copyright © 2016 twof. All rights reserved.
//

import UIKit

class RepProfileVC: UIViewController, UIGestureRecognizerDelegate {
	
	var rep: RepModel? {
		didSet {
			updateData()
		}
	}
	var exitSegue = ""
	
	@IBOutlet weak var nameLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		updateData()
	}
	
	func updateData() {
		
		nameLabel?.text=rep?.getFullName() ?? "NO_REP"
	}
	
	func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
		dismiss(animated: true, completion: nil)
		//self.navigationController?.popViewController(animated: true)
		return true
	}
}
