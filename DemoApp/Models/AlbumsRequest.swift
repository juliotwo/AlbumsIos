//
//  AlbumsRequest.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/27/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

struct Albums: Codable {
    let id: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
    }
}

struct AlbumsDetails: Codable {
    let title: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case url = "url"
    }
}
