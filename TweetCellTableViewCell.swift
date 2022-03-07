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
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
