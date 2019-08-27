//
//  UsersServices.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/24/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import Alamofire

class UsersServices {
    static func getUsers(completion: @escaping ([UserDetails]?) -> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        Alamofire.request(urlString, headers: headers).response { response in
            guard let data =  response.data else { return }
            print(data)
            do {
                let decoder = JSONDecoder()
                let usersRequest = try decoder.decode([UserDetails].self, from: data)
                print(usersRequest)
                completion(usersRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
