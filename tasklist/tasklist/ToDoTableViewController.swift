//
//  ToDoTableViewController.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/04.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit


class ToDoTableViewController: UITableViewController {
    
    
//    var todos = [String]()
//    var details = [String]()
//    var allsTodo = [ToDoInformation]()
    var allToDo: [ToDoInformation] = []
    
    var sectionCell = ["セクションテスト"]
    //セクションテスト
    
    
    @IBAction func rewindTitle(sender: UIStoryboardSegue) {
        //saveを押してセグエを巻き戻す際に実行されるメソッド
        guard let previousTitle = sender.source as? AddController, let todo = previousTitle.todo else {
            //遷移元の画面を取得
            //prepareから渡ってくるtitle.textを取得する
            return
        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
            //saveを押して戻ってきた時にセルが選択されているかどうかで条件分岐
            //選択されているかどうかは、tableView.indexPathForSelectedRowがnilでないかでわかる
            self.allToDo[selectedIndexPath.row] = todo
            
            //選択されていた場合の処理
            //選択されたセルを新しいデータに変更

        } else {
            self.allToDo.append(todo)
            //選択されていなかった場合の処理
            //titleから渡ってきた値をtodosに入れる
        }
//        self.userDefaults.set(self.todos, forKey: "todos")
        //データが変わったところでUserDefaultsを更新する処理


        allToDo.sort()
        //ソート

        self.tableView.reloadData()
        //tableView を再読み込み

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.tableView.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        self.tableView.register(UINib(nibName: "ToDoHederTableViewCell", bundle: nil), forCellReuseIdentifier: "hederCell")
       
        let hederCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "hederCell")!
        let hederViewe: UIView = hederCell.contentView
        tableView.tableHeaderView = hederViewe
        //ヘッダー
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
        //リストがいくつのセクションに別れているかを返す
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectioTitle = ["説明(セクション)", "ToDo一覧"]
        return sectioTitle[section]
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //何行か行数を返すメソッド

        if section == 0 {
            return sectionCell.count
            
        } else if section == 1 {
            return allToDo.count
            
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ToDoTableViewCell
        //実際に[todos]のデータをリストに表示するメソッド
        //リストの行である Cell を作ってそれを返す処理

        if indexPath.section == 0 {
            cell.cellTitleLabel?.text = "タイトルを入れます"
            cell.cellDetailLabel?.text = "詳細を入れます"
            cell.cellCalenderLabel?.text = "日付が入ります"
            
        } else if indexPath.section == 1 {
            let todo = allToDo[indexPath.row]

            cell.cellTitleLabel?.text = todo.inTitle
            cell.cellDetailLabel?.text = todo.inDetail
            cell.cellCalenderLabel?.text = todo.inCalendar.convertDate()

            }

        
        
        //        cell.cellCalenderLabel = todo.inCalendar

//        cell.textLabel?.text = todo.inTitle
//        cell.detailTextLabel?.text = todo.inDetail

        
        //Cell が何行目かに応じてメモの値を表示>indexPathh型
        
        return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //スワイプして削除ボタンが出るようになるメソッド
        if editingStyle == .delete {
            // Delete the row from the data source
            self.allToDo.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            //該当する行を TableView から消す(初めからある)
        }
    }

    
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの遷移
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.present(AddController(), animated: true, completion: nil)
        
        let todoTB = AddController()
        let todo = allToDo[(tableView.indexPathForSelectedRow?.row)!]
        todoTB.todo = todo

        
        
        
    }
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //タップされた行のcellを遷移先の画面に渡す
        //segue で遷移する前に呼ばれる prepare メソッドを使用
        guard let identifier = segue.identifier else {
            //guardでsegueのidenteifierをセット
            return
            //セットできなかった場合は処理を止める
        }
        if identifier == "editTodo" {
            let todoTB = segue.destination as! AddController
            //セットできた場合、 identifier が editTodo かどうかをチェック
            //editTodo の場合は遷移先の ViewController を取得
            //キャストの意味がわからない
            
            let todo = allToDo[(tableView.indexPathForSelectedRow?.row)!]
            todoTB.todo = todo
//            todoTB.taitle = self.todos[(self.tableView.indexPathForSelectedRow?.row)!]
            // プロパティに選択されている行の todo を入れる処理
            //=addController のviewDidLoad で値を受け取る
            
//            let lorddetails = UserDefaults.standard.object(forKey: "details")
//            todoTB.detail = details[(self.tableView.indexPathForSelectedRow?.row)!]
            //詳細の実装
            
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
