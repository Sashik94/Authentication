//
//  User.swift
//  Authentication
//
//  Created by Александр Осипов on 29.05.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import Foundation

struct User {
    let login: String
    let id: String
    let access_token: String
    
    init?(json: [String: Any]) {

        guard
            let login = json["login"] as? String,
            let id = json["id"] as? String,
            let access_token = json["access_token"] as? String
        else {
            return nil
        }
        
        self.login = login
        self.id = id
        self.access_token = access_token
    }

    static func getArray(from jsonArray: Any) -> [User]? {

        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        var users: [User] = []

        for jsonObject in jsonArray {
            if let user = User(json: jsonObject) {
                users.append(user)
            }
        }
        return users
    }
}
