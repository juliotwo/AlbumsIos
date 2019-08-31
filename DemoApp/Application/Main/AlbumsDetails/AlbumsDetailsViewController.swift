//
//  AlbumsDetailsViewController.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/28/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

//public var screenWidth: CGFloat {
//    return UIScreen.main.bounds.size.width
//}
//public var screenHeight: CGFloat {
//    return UIScreen.main.bounds.size.height
//}

class AlbumsDetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var TitleAlbumLabel: UILabel!
    
    
    public var titleAlbum: String?
    public var id: Int?
    
//    public var estimateWidth = 160.0
//    var cellMarginCell = 16.0
    
    public var viewModel = AlbumDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getData(id: id!)
        
        TitleAlbumLabel.text = titleAlbum
    }
}

extension AlbumsDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.numberOfItems
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CellAlbumsDetailsCollection else { return UICollectionViewCell() }
        
        let cellView = viewModel.item(at: indexPath)
        cell.viewModel = cellView
        
        return cell
    }
}

extension AlbumsDetailsViewController: AlbumDetailsViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension AlbumsDetailsViewController: UICollectionViewDelegate {
    
}

extension AlbumsDetailsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cell = (width - 30) / 3
        return CGSize(width: cell, height: cell / 0.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10); 
//    }
}
