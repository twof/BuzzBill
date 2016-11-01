//
//  BillModel.swift
//  BuzzBill
//
//  Created by William Wold on 11/1/16.
//  Copyright © 2016 twof. All rights reserved.
//

import Foundation
import SwiftyJSON

class BillModel {
	
	static var updatedCallback: ((BillModel) -> ())?
	
	let title: String
	let summery: String
	
	init(jsonData data: JSON) {
		
		title = data["short_title"].string ?? "No bill title available"
		summery = data["summary"].string ?? "No summery available"
		
		BillModel.updatedCallback?(self)
	}
}


var bills = [BillModel]()
