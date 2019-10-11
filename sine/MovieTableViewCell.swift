//
//  MovieTableViewCell.swift
//  sine
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var filename: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
