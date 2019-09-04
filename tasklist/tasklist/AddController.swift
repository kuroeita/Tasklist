//
//  AddController.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/08/28.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    
    var taitle: String?

    
    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //なぜアクション接続でなかったのか不明
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //saveボタンを押した時の準備
        //segueによる遷移が行われる前に実行される prepare メソッド
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else {
            return
        }
        self.title = self.todoTitle.text ?? ""
        //チェックがOKだった箇所の処理
    }
    

}
