//
//  BMTableViewCell.swift
//  BlackMusicCenter
//
//  Created by Manouana on 13/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import UIKit

class BMTableViewCell: UITableViewCell {

  

    @IBOutlet weak var genreLabel: UILabel!

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var musicImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
