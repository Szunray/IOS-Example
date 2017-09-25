//
//  RosterCell.swift
//  MonsterRoster
//
//  Created by user128720 on 8/1/17.
//  Copyright © 2017 djbcn6. All rights reserved.
//

import UIKit

class RosterCell: UITableViewCell {
    @IBOutlet weak var spriteView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
