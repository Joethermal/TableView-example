//
//  DetailViewController.swift
//  TableView-2
//
//  Created by Joseph Ward on 18/08/18.
//  Copyright © 2018 Joethermal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    
    var detailString: String?
    var detailImageString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = detailString
        //detailLabel.text = detailString
        detailImage.image = UIImage(named: detailImageString!)
        
        
    }

    

}
