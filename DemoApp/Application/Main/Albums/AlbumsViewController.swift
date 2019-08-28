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
    
    var viewModel = AlbumsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AlbumsViewController: AlbumsViewDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}

extension AlbumsViewController: UITabBarDelegate {
    
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
    
    
}
