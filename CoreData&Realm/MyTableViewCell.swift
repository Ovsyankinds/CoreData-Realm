//
//  MyTableViewCell.swift
//  CoreData&Realm
//
//  Created by Ovsyankinds on 04/09/2017.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sernameLabel: UILabel?
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
