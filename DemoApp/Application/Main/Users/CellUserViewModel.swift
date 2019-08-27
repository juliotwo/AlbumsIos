//
//  CellUserViewModel.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/25/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CellUserViewModel: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    
    var viewModel: UserDetailsViewModel! {
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
    
    var userArray = ["man1", "man2", "girl1", "girl2"]
    
    
    func setUpView() {
        
        let random = Int(arc4random_uniform(UInt32(self.userArray.count)))
        let image = UIImage.init(named: "\(userArray[random])")
        let imageView = UIImageView.init(image: image)

        nameUser.text = viewModel.name
        emailUser.text = viewModel.email
        imageUser.image = imageView.image
    }

}
