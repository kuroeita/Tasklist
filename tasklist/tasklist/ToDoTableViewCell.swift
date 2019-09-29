//
//  ToDoTableViewCell.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/18.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDetailLabel: UILabel!
    @IBOutlet weak var cellCalenderLabel: UILabel!
    
        
    @IBAction func likeSetteing(_ sender: UIButton) {
        sender.setTitle("お気に入り済み", for: .normal)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
