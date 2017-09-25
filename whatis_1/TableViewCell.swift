//
//  TableViewCell.swift
//  whatis_1
//
//  Created by student on 10/18/16.
//  Copyright © 2016 Nitit Rungrojaree. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var titleGame: UILabel!
    @IBOutlet weak var gameImage: UIImageView!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
