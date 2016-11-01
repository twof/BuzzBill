//
//  RepModel.swift
//  BuzzBill
//
//  Created by William Wold on 10/31/16.
//  Copyright © 2016 twof. All rights reserved.
//

import Foundation
import SwiftyJSON

class RepModel {
	
	static var repUpdatedCallback: ((RepModel) -> ())?
	
	let firstName: String
	let lastName: String
	
	var websiteURL: String? = nil
	var facebookURL: String? = nil
	var youtubeURL: String? = nil
	var twitterURL: String? = nil
	
	var picture: UIImage? = nil
	
	init(jsonData data: JSON) {
		firstName = data["first_name"].string ?? "NO_FIRST_NAME"
		lastName = data["last_name"].string ?? "NO_LAST_NAME"
		
		let bioGuideID = data["bioguide_id"].string
		if let bioGuideID = bioGuideID {
			let firstLetter = bioGuideID[bioGuideID.startIndex]
			let imageURL = "http://bioguide.congress.gov/bioguide/photo/\(firstLetter)/\(bioGuideID).jpg"
			getImageFromURL(url: imageURL, callback: { (image) in
				self.picture = image
				RepModel.repUpdatedCallback?(self)
			})
		}
		
		let fbID = data["facebook_id"].string
		if let fbID = fbID {
			facebookURL = "https://www.facebook.com/\(fbID)/"
		}
		
		let ytID = data["youtube_id"].string
		if let ytID = ytID {
			youtubeURL = "https://www.youtube.com/user/\(ytID)"
		}
		
		let twID = data["twitter_id"].string
		if let twID = twID {
			twitterURL = "https://twitter.com/\(twID)"
		}
		
		let webURL = data["website"].string
		if let webURL = webURL {
			websiteURL = webURL
		}
		
		RepModel.repUpdatedCallback?(self)
	}
	
	func getFullName() -> String {
		return "\(firstName) \(lastName)"
	}
}

var representatives = [RepModel]()


