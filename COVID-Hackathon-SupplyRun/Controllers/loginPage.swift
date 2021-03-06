//
//  loginPage.swift
//  COVID-Hackathon-SupplyRun
//
//  Created by Vignesh Krishnan on 3/28/20.
//  Copyright © 2020 Vignesh Krishnan. All rights reserved.
//

import Foundation
import UIKit
import AWSAuthCore
import AWSAuthUI

class loginPage : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        showSignIn();
    }
    
    func showSignIn() {
        if !AWSSignInManager.sharedInstance().isLoggedIn {
           AWSAuthUIViewController
             .presentViewController(with: self.navigationController!,
                  configuration: nil,
                  completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                     if error != nil {
                         print("Error occurred: \(String(describing: error))")
                     } else {
                        let roleView = self.storyboard?.instantiateViewController(withIdentifier: "roleViewController") as! UIViewController
                        self.navigationController?.pushViewController(roleView, animated: true)
                     }
                  })
        }
    }
    
}
