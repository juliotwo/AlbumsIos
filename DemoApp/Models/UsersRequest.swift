//
//  UsersRequest.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/24/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

struct UserDetails: Codable {
    let name: String?
    let email: String?
    let username: String?
    let website: String?
    let company: Company?
    let phone : String?
    let address :  Address?
    
    enum CodinKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case username = "username"
        case website = "website"
        case company
        case phone = "phone"
        case address
    }
    
    struct Company: Codable {
        let name: String?
        
        enum CodinKeys: String, CodingKey {
            case name = "name"
        }
    }
    
    struct Address: Codable {
        let street: String?
        let suite: String?
        let city: String?
        
        enum CodinKeys: String, CodingKey {
            case street = "street"
            case suite = "suite"
            case city = "city"
        }
    }
}
