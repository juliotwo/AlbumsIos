//
//  AlbumsServices.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/27/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
import Alamofire

class AlbumsServices {
    static func getAlbums(completion: @escaping ([Albums]?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/albums"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        Alamofire.request(urlString, headers: headers).response { response in
            guard let data = response.data else { return }
            print(data)
            do {
                let decoder = JSONDecoder()
                let albumsRequest = try decoder.decode([Albums].self, from: data)
                print(albumsRequest)
                completion(albumsRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
