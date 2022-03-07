//
//  LoginViewController.swift
//  Twitter
//
//  Created by Eric Tang on 3/5/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBAction func onLoginButton(_ sender: Any) {
		
		let myUrl = "https://api.twitter.com/oauth/request_token"
		TwitterAPICaller.client?.login(url: myUrl, success: {
			
			// remembers user logged in before, userLoggedIn = true when user logs in
			UserDefaults.standard.set(true, forKey: "userLoggedIn")
			self.performSegue(withIdentifier: "loginToHome", sender: self)
		}, failure: { (Error) in
			print("Could not log in")
		})
	}
	
	// when login page shows up
	override func viewDidAppear(_ animated: Bool) {
		if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
			self.performSegue(withIdentifier: "loginToHome", sender: self)
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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