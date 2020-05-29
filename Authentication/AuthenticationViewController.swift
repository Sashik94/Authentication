//
//  AuthenticationViewController.swift
//  Authentication
//
//  Created by Александр Осипов on 29.05.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    
    var userData: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillIn()
        
    }
    
    func fillIn() {
        loginLabel.text = userData?.login
        idLabel.text = userData?.id
    }
    
}
