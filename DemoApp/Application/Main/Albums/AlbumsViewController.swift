//
//  AlbumsViewController.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/24/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var titleAlbum: String?
    private var id: Int?
    
    var viewModel = AlbumsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getData()
        
    }
}

extension AlbumsViewController: AlbumsViewDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}

extension AlbumsViewController: UITableViewDelegate {
    
}

extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.numberOfItems
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellAlbumsTableViewCell else{ return UITableViewCell() }
        
        cell.viewModel = viewModel.item(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.titleAlbum = viewModel.item(at: indexPath).title
        self.id = viewModel.item(at: indexPath).id
        self.performSegue(withIdentifier: "GoToAlbumsDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? AlbumsDetailsViewController else { return }
        pass.titleAlbum = self.titleAlbum
        pass.id = self.id
    }
    
    
}
