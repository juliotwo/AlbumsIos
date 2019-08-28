//
//  AlbumsViewModel.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/27/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

protocol AlbumsViewDelegate {
    func reloadData()
}
class AlbumsViewModel {
    private var items: [Albums] = []
    
    var numberOfItems: Int {
        return items.count
    }
    
    var delegate :  AlbumsViewDelegate?
    
    init() {
        getData()
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: Notification.Name("AddedNewData"), object: nil)
    }

    @objc public func getData() {
        AlbumsServices.getAlbums { (lista) in
            guard let lista = lista else { return }
            self.items = lista
            self.delegate?.reloadData()
        }
    }
    
    func item(at indexPath: IndexPath) -> AlbumsDetailsViewModel {
        return AlbumsDetailsViewModel(details: items[indexPath.row])
    }
}

class AlbumsDetailsViewModel {
    
    private var details: Albums
    
    var title: String {
        return details.title ?? ""
    }
    
    var id: Int {
        return details.id ?? 0
    }
    
    init(details: Albums) {
        self.details = details
    }
}
