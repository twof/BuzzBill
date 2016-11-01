//
//  ScoreboardVC.swift
//  BuzzBill
//
//  Created by William Wold on 10/31/16.
//  Copyright © 2016 twof. All rights reserved.
//

import UIKit

class RepCell: UITableViewCell {
	
	var rep: RepModel?
	@IBOutlet weak var nameLabel: UILabel!
	
	func setRep(repIn: RepModel) {
		
		rep=repIn
		
		nameLabel.text=rep?.getFullName() ?? "NO_REP"
	}
}

class ScoreboardVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	
	private var repProfileToView: RepModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return representatives.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "repTableCell") as! RepCell
		
		cell.setRep(repIn: representatives[indexPath.row])
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		
		repProfileToView = representatives[indexPath.row]
		performSegue(withIdentifier: "showRepProfileSegue", sender: self)
		return false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier=="showRepProfileSegue") {
			let target = segue.destination as! RepProfileVC
			if let rep = repProfileToView{
				target.rep=rep
			}
		}
	}
}
