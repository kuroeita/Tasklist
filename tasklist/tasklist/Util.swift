//
//  Util.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/20.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import Foundation

class Util {
    
    static func convertDate(date: Date) ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

extension Date {
    
    func convertDate() ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
