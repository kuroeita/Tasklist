//
//  AddController.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/08/28.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class ToDoInformation: Comparable {
    static func < (lhs: ToDoInformation, rhs: ToDoInformation) -> Bool {
        return lhs.inCalendar > rhs.inCalendar
    }
    
    static func == (lhs: ToDoInformation, rhs: ToDoInformation) -> Bool {
        return lhs.inCalendar == rhs.inCalendar
    }
    
    var inTitle: String
    var inDetail: String
    var inCalendar: Date

    init(_ title: String, _ detail: String, _ calendar: Date) {
        self.inTitle = title
        self.inDetail = detail
        self.inCalendar = calendar
    }
}

class AddController: UIViewController {
    
    //詳細の実装のため追加
    var todo: ToDoInformation?
     var calender: UIDatePicker = UIDatePicker()
    
    
    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //なぜアクション接続でなかったのか不明
    @IBOutlet weak var todoDetails: UITextField!
    @IBOutlet weak var calendarField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.saveButton.isEnabled = false
//        //文字が入力されるまでSave ボタンを無効←privateメソッドで書く
        
        if let todo = self.todo {
            //prepare メソッドから値が渡されていたら taitle に値がセットされている
            self.todoTitle.text = todo.inTitle
            //値がセットされていたらedittitleに値を渡す
            self.navigationItem.title = "Details"
            //値がセットされていたらタイトルを変更
            //ボタンも変更したい
            self.todoDetails.text = todo.inDetail
            self.calendarField.text = convertDate(date: todo.inCalendar)

        }

        self.saveButtinState()
        //TextField の値を設定した後に呼ぶ
        
        calender.datePickerMode = UIDatePicker.Mode.date
        calender.timeZone = NSTimeZone.local
        calender.locale = Locale.current
        calendarField.inputView = calender
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        calendarField.inputView = calender
        calendarField.inputAccessoryView = toolbar
        //カレンダー
    }
    
    @objc func done() {
        calendarField.endEditing(true)
        
        calendarField.text = convertDate(date: calender.date)
    }
   
    func convertDate(date: Date) ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
        
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
        todo = ToDoInformation(todoTitle.text ?? "", todoDetails.text ?? "", calender.date)
//        self.taitle = self.todoTitle.text ?? ""
//        //チェックがOKだった箇所の処理
//        self.detail = self.todoDetails.text ?? ""
        //詳細の実装のため追加

    }
    

}
