//
//  SectionTableViewCell.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/30.
//  Copyright © 2019 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
