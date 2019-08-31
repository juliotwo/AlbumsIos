//
//  AlbumDetailsViewModel.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/28/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

protocol AlbumDetailsViewModelDelegate {
    func reloadData()
}

class AlbumDetailsViewModel {
    
    private var items: [AlbumsDetailsRequest] = []
    
    var numberOfItems: Int {
        return items.count
    }
    
    var delegate: AlbumDetailsViewModelDelegate?
    
//    init() {
//        getData(id: Int)
//    }
    
    @objc public func getData(id: Int) {
        AlbumsServices.getAlbumsDetails(byId: id) { (lista) in
            guard let lista = lista else { return }
            self.items = lista
            self.delegate?.reloadData()
        }
    }
    
    func item(at indexPath: IndexPath) -> DetailsAlbumViewModel {
        return DetailsAlbumViewModel(details: items[indexPath.item])
    }

}

class DetailsAlbumViewModel {
    private var details: AlbumsDetailsRequest
    
    var title: String {
        return details.title ?? ""
    }
    var url: String {
        return details.url ?? ""
    }
    init(details: AlbumsDetailsRequest) {
        self.details = details
    }
}
