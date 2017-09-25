//
//  SelectGameViewCell.swift
//  whatis_1
//
//  Created by student on 10/25/16.
//  Copyright © 2016 Nitit Rungrojaree. All rights reserved.
//

import UIKit

class SelectGameViewCell: UITableViewCell {

    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
