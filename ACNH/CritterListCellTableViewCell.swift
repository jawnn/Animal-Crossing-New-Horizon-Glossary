//
//  CritterListCellTableViewCell.swift
//  ACNH
//
//  Created by Roberto Manese III on 7/22/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import UIKit

class CritterListCell: UITableViewCell {

    @IBOutlet var icon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(bug: Bug) {
        if let iconURL = URL(string: bug.iconUrl) {
            icon.load(url: iconURL)
        }
    }
}
