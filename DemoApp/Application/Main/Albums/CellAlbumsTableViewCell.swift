//
//  CellAlbumsTableViewCell.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/27/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CellAlbumsTableViewCell: UITableViewCell {

    @IBOutlet weak var idAlbum: UILabel!
    @IBOutlet weak var titleAlbum: UILabel!
    
    var viewModel: AlbumsDetailsViewModel! {
        didSet {
            setUpView()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView() {
        let id = String(viewModel.id)
        idAlbum.text = id
        titleAlbum.text = viewModel.title
    }

}
