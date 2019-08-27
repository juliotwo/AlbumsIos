//
//  UserViewModel.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/25/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation

protocol UserViewModelDelegate {
    func reloadData()
}

class UsersViewModel {
    private var items: [UserDetails] = []
    
    var numberOfItems: Int {
        return items.count
    }

    var delegate : UserViewModelDelegate?
    
    init() {
        getData()
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: Notification.Name("AddedNewData"), object: nil)
    }
    
    @objc public func getData() {
        UsersServices.getUsers { (lista) in
            guard let lista = lista else { return }
            self.items = lista
            self.delegate?.reloadData()
        }
    }
    
    func item(at indexPath: IndexPath) -> UserDetailsViewModel {
        return UserDetailsViewModel(details: items[indexPath.row])
    }
}

class UserDetailsViewModel {
    private var details: UserDetails
    
    var name: String {
        return details.name ?? ""
    }
    var email: String {
        return details.email ?? ""
    }
    var username: String {
        return details.username ?? ""
    }
    var website: String {
        return details.website ?? ""
    }
    var namecompany: String {
        return details.company?.name ?? ""
    }
    var phone: String {
        return details.phone ?? ""
    }
    var city: String {
        return details.address?.city ?? ""
    }
    var street: String {
        return details.address?.street ?? ""
    }
    init(details: UserDetails) {
        self.details = details
    }
}
