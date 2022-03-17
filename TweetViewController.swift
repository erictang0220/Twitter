//
//  TweetViewController.swift
//  Twitter
//
//  Created by Eric Tang on 3/14/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

	@IBOutlet weak var remainingCharCount: UILabel!
	@IBAction func cancel(_ sender: Any) {
		dismiss(animated: true, completion: nil)
		
	}
	
	@IBAction func tweet(_ sender: Any) {
		if(!tweetTextView.text.isEmpty) {
			TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text,
				success: {self.dismiss(animated: true, completion: nil)},
			    failure: { (error) in print("Error posting tweet \(error)")
				self.dismiss(animated: true, completion: nil)}
			)
		}
		else {
			self.dismiss(animated: true, completion: nil)
		}
	}
	
	@IBOutlet weak var tweetTextView: UITextView!
	
	// Set the max character limit
	let characterLimit = 280
	
	func textViewDidChange(_ textView: UITextView) {
//		remainingCharCount.text = "\(characterLimit - textView.text.count) characters left"
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		
		// Construct what the new text would be if we allowed the user's latest edit
		let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
		
		// The new text should be allowed? True/False
		return newText.count < characterLimit

	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		// let user know can take text, keyboard/cursor pop up
		tweetTextView.becomeFirstResponder()
		tweetTextView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
