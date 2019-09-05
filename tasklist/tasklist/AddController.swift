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
        
//        self.saveButton.isEnabled = false
//        //文字が入力されるまでSave ボタンを無効←privateメソッドで書く
        
        if let edittitle = self.taitle {
            //prepare メソッドから値が渡されていたら taitle に値がセットされている
            self.todoTitle.text = edittitle
            //値がセットされていたらedittitleに値を渡す
            self.navigationItem.title = "Details"
            //値がセットされていたらタイトルを変更
            //ボタンも変更したい
        }
        self.saveButtinState()
        //TextField の値を設定した後に呼ぶ
    }
    
    private func saveButtinState() {
        //saveButtonの中身がなかった時に無効にする処理
        let title = self.todoTitle.text ?? ""
        self.saveButton.isEnabled = !title.isEmpty
            }
    
    
     @IBAction func titleTextFieldChanged(_ sender: Any) {
        //textField に入力された値を検出
//        let title = self.todoTitle.text ?? "" ←praivateメソッドで処理
//        //nil だったら空文字にする
//        self.saveButton.isEnabled = !title.isEmpty
//        //空文字じゃなかったら有効
        self.saveButtinState()
        //saveButtonの中身がなかった時に無効にする処理を呼ぶ
    }
    
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController {
            //モーダル閉じるととセグエを辿って戻るがあるので、条件分岐
            //presentingViewController に今の ViewController を表示している ViewController がセットされている
            
            self.dismiss(animated: true, completion: nil)
            //キャンセルを押した時にモーダルを閉じる処理
            //アニメーションは true、終わった後の処理は特にないので nil
        } else {
            self.navigationController?.popViewController(animated: true)
            //モーダルでは無く、showしたsegueを逆に戻る時の処理
            //popViewControllerという命令を使う
        }
        
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //saveボタンを押した時の準備
        //segueによる遷移が行われる前に実行される prepare メソッド
        guard let button = sender as? UIBarButtonItem, button === self.saveButton
            else {
            return
        }
        self.taitle = self.todoTitle.text ?? ""
        //チェックがOKだった箇所の処理
    }
    

}
