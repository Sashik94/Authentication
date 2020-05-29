//
//  ViewController.swift
//  Authentication
//
//  Created by Александр Осипов on 29.05.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var Parameters = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func searchTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func singInButton(_ sender: UIButton) {
        if let login = loginTextField.text {
            Parameters["username"] = login
        }
        if let password = passwordTextField.text {
            Parameters["password"] = password
        }
        AF.request("http://37.140.199.187:3000/auth/login", method: .post, parameters: Parameters).validate().responseJSON { responseJSON in
            print(responseJSON)
            switch responseJSON.result {
            case .success(let value):
                guard
                    let jsonObject = value as? [String: Any],
                    let user = User(json: jsonObject)
                    else { return }
                print(user)
                self.segue(user)
            case .failure(let error):
                print(error)
            }
        }
    }
    func segue(_ user: User) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let AuthenticationViewController = storyboard.instantiateViewController(identifier: "AuthenticationViewController") as? AuthenticationViewController else { return }
        AuthenticationViewController.userData = user
        AuthenticationViewController.modalPresentationStyle = .fullScreen
        show(AuthenticationViewController, sender: nil)
    }

}

