//
//  MyTableViewCell.swift
//  TableView-2
//
//  Created by Joseph Ward on 18/08/18.
//  Copyright © 2018 Joethermal. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

   
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    var cellString: String? {
        didSet {
            cellText.text = cellString
        }
    }
    
    var imageString: String? {
        didSet {
            cellImage.image = UIImage(named: imageString! + ".png")
        }
    }
    
    
}
