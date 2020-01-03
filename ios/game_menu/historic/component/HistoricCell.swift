//
//  HistoricCell.swift
//  ios
//
//  Created by Matthew on 7/27/19.
//  Copyright © 2019 bahlsenwitz. All rights reserved.
//

import UIKit

class HistoricCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var eloLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
