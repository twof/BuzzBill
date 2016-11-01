//
//  ScoreboardVC.swift
//  BuzzBill
//
//  Created by William Wold on 10/31/16.
//  Copyright © 2016 twof. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell {
	
	var bill: BillModel?
	@IBOutlet weak var nameLabel: UILabel!
	
	func setBill(billIn: BillModel) {
		
		bill = billIn
		
		nameLabel.text=bill!.title
	}
}

class QueueVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	
	private var billToView: BillModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getBills() { (data) in
			bills = data
			self.tableView.reloadData()
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		BillModel.updatedCallback = { (bill: BillModel) -> () in
			self.tableView.reloadData()
		}
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return bills.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "billCellId") as! BillCell
		
		cell.setBill(billIn: bills[indexPath.row])
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		
		billToView = bills[indexPath.row]
		performSegue(withIdentifier: "billSummerySegue", sender: self)
		return false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier=="billSummerySegue") {
			let target = segue.destination as! SummaryView
			if let bill = billToView{
				target.bill=bill
			}
		}
	}
}
