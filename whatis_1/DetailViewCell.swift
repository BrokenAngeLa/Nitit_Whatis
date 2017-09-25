//
//  DetailViewCell.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/11/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet weak var obLabel: UILabel!

    @IBOutlet weak var obImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
