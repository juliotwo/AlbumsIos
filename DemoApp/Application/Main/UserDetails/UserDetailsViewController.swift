//
//  UserDetailsViewController.swift
//  DemoApp
//
//  Created by SalvadorKano on 8/25/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var nameDetails: UILabel!
    @IBOutlet weak var usernameDetails: UILabel!
    @IBOutlet weak var webSiteDetails: UILabel!
    @IBOutlet weak var companyNameDetails: UILabel!
    
    
    @IBOutlet weak var emailDetails: UILabel!
    @IBOutlet weak var phoneDetails: UILabel!
    @IBOutlet weak var addressDetails: UILabel!
    
    public var name: String?
    public var username: String?
    public var email: String?
    public var website: String?
    public var nameCompany: String?
    public var phone: String?
    public var city: String?
    public var street: String?
    
    var userArray = ["man1", "man2", "girl1", "girl2"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let random = Int(arc4random_uniform(UInt32(self.userArray.count)))
        let image = UIImage.init(named: "\(userArray[random])")
        let imageView = UIImageView.init(image: image)
        
        imageDetails.image = imageView.image
        nameDetails.text = name
        usernameDetails.text = username
        webSiteDetails.text = website
        companyNameDetails.text = nameCompany
        
        emailDetails.text = email
        phoneDetails.text = phone
        addressDetails.text = street
//        print(name)
//        print(username)
//        print(email)
//        print(website)
//        print(nameCompany)
//        print(phone)
//        print(city)
//        print(street)
        

        // Do any additional setup after loading the view.
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
