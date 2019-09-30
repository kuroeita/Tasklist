//
//  ToDoTableViewCell.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/18.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    var likeSetteingButtonFlag: Bool = false
    
    @IBOutlet weak var likeSetteingColor: UIButton!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDetailLabel: UILabel!
    @IBOutlet weak var cellCalenderLabel: UILabel!
    @IBAction func likeSetteing(_ sender: UIButton) {
        
        if likeSetteingButtonFlag == false {
            sender.setTitle("お気に入り登録", for: .normal)
            sender.setTitleColor(UIColor.black, for: .normal)
            let cloer2 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            likeSetteingColor.backgroundColor = cloer2
            likeSetteingButtonFlag = true
            

        } else if likeSetteingButtonFlag == true {
            sender.setTitle("お気に入り済み", for: .normal)
            sender.setTitleColor(UIColor.white, for: .normal)
            let cloer3 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            likeSetteingColor.backgroundColor = cloer3
            likeSetteingButtonFlag = false
            
        }

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let cloer = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        likeSetteingColor.backgroundColor = cloer
        likeSetteingColor.layer.borderWidth = 1.5
        likeSetteingColor.layer.borderColor = UIColor.black.cgColor
        likeSetteingButtonFlag = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
