//
//  ToDoHederTableViewCell.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/23.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class ToDoHederTableViewCell: UITableViewCell {

    @IBOutlet weak var hederImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        hederImage.image = UIImage(named: "AppIcon")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
