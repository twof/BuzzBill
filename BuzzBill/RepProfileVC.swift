//
//  RepProfileVC.swift
//  BuzzBill
//
//  Created by William Wold on 10/31/16.
//  Copyright © 2016 twof. All rights reserved.
//

import UIKit

class RepProfileVC: UIViewController, UIGestureRecognizerDelegate {
	
	var viewIsAppeared = false
	
	var rep: RepModel? {
		didSet {
			updateData()
		}
	}
	
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBOutlet weak var websiteBtn: UIButton!
	@IBOutlet weak var facebookBtn: UIButton!
	@IBOutlet weak var youtubeBtn: UIButton!
	@IBOutlet weak var twitterBtn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let btnCornerRad = CGFloat(6.0)
		websiteBtn.layer.cornerRadius = btnCornerRad
		facebookBtn.layer.cornerRadius = btnCornerRad
		youtubeBtn.layer.cornerRadius = btnCornerRad
		twitterBtn.layer.cornerRadius = btnCornerRad
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		viewIsAppeared = true
		
		updateData()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		viewIsAppeared = false
	}
	
	func updateData() {
		
		//check if view has appeared, if not, stuff may not yet be loaded which leads to crash
		//don't worry, this func will be called again after view has appeared
		if viewIsAppeared {
			if let rep = rep {
				nameLabel.text = rep.getFullName()
				websiteBtn.isHidden = (rep.websiteURL == nil)
			}
			else {
				nameLabel.text = "NO REP"
			}
		}
		
	}
	
	func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
		dismiss(animated: true, completion: nil)
		return true
	}
	
	@IBAction func websiteBtnPressed(_ sender: AnyObject) {
		if let url = rep?.websiteURL {
			launchURL(url: url)
		}
	}
	
	@IBAction func facebookBtnPressed(_ sender: AnyObject) {
		
		if let url = rep?.facebookURL {
			launchURL(url: url)
		}
	}
	
	@IBAction func youtubeBtnPressed(_ sender: AnyObject) {
		if let url = rep?.youtubeURL {
			launchURL(url: url)
		}
	}
	
	@IBAction func twitterBtnPressed(_ sender: AnyObject) {
		
		if let url = rep?.twitterURL {
			launchURL(url: url)
		}
	}
}
