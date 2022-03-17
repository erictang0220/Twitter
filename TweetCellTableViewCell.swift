//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Eric Tang on 3/5/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var tweetContent: UILabel!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var favButton: UIButton!
	@IBOutlet weak var retweetButton: UIButton!
	@IBAction func favoriteTweet(_ sender: Any) {
		let toBeFavorited = !favorited
		if(toBeFavorited) {
			TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId,
		    success:{ self.setFavorite(true)},
			failure: { (error) in print("Favorite did not succeed: \(error)")}
			)
		}
		else {
			TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId,
		    success:{ self.setFavorite(false)},
		    failure: { (error) in print("Unfavorite did not succeed: \(error)")}
			)
		}
	}
	
	@IBAction func retweet(_ sender: Any) {
		TwitterAPICaller.client?.retweet(tweetId: tweetId,
		 success:{ self.setRetweeted(true)},
		 failure: {(error) in print("Retweeting did not succeed: \(error)") })
	}
	
	var tweetId:Int = -1
	var favorited:Bool = false
	
	func setFavorite(_ isFavorited:Bool) {
		favorited = isFavorited
		if (favorited) {
			favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
		}
		else {
			favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
		}
	}
	
	func setRetweeted(_ isRetweeted:Bool) {
		if(isRetweeted) {
			print("set green")
			retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
			retweetButton.isEnabled = false // after the user retweets, it can't be changed
		}
		else {
			retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
			retweetButton.isEnabled = true
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
