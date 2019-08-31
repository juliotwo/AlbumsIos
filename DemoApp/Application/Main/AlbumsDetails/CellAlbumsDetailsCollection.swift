//
//  CellAlbumsDetailsCollection.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/28/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CellAlbumsDetailsCollection: UICollectionViewCell {
    
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var titleAlbum: UILabel!
    
    var viewModel: DetailsAlbumViewModel! {
        didSet{
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpView() {
//        titleAlbum.text = viewModel.title
        imageAlbum.load(url: URL(string: "\(viewModel.url)")!)
    }
}
