//
//  UsersViewController.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/24/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var name: String?
    private var username: String?
    private var website: String?
    private var nameCompany: String?
    private var email: String?
    private var phone: String?
    private var city: String?
    private var street: String?

    
    var viewModel = UsersViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getData()
    }
}

extension UsersViewController : UserViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}

extension UsersViewController : UITableViewDelegate {
    
}

extension UsersViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.numberOfItems
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellUserViewModel else { return UITableViewCell() }
        
        cell.viewModel = viewModel.item(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.name = viewModel.item(at: indexPath).name
        self.username = viewModel.item(at: indexPath).username
        self.website = viewModel.item(at: indexPath).website
        self.nameCompany = viewModel.item(at: indexPath).namecompany
        self.email = viewModel.item(at: indexPath).email
        self.phone = viewModel.item(at: indexPath).phone
        self.city = viewModel.item(at: indexPath).city
        self.street = viewModel.item(at: indexPath).street
        self.performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? UserDetailsViewController else { return }
        pass.name = self.name
        pass.username = self.username
        pass.website = self.website
        pass.nameCompany = self.nameCompany
        pass.email = self.email
        pass.phone = self.phone
        pass.city = self.city
        pass.street = self.street
    }
    
    
}


