//
//  ScoreBoardViewCell.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 10/18/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import UIKit

class ScoreBoardViewCell: UITableViewCell {
    
    @IBOutlet weak var imageRank: UIImageView!
    @IBOutlet weak var rankNameScore: UILabel!
    @IBOutlet weak var dateMode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
