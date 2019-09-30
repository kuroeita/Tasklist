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
    
    enum Sections: Int {
        case explanation = 0
        case todoList = 1
        
    }
    
        
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
        self.tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyCell")
        self.tableView.register(UINib(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionCell")
        
        
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

//        switch Sections(rawValue: section) {
//        case .some(.explanation):
//            return sectionCell.count
//        case .some(.todoList):
//            if self.allToDo.count == 0 {
//                return 1
//                //何も無い時ようのcellを出すために1返す
//
//            } else {
//                return allToDo.count
//
//            }
//        case .none:
//            break
//        }
//        return 0
//        //ここで何をどこに返しているかもわからん
//    }
        
      
        if section == 0 {
            return sectionCell.count

        } else if section == 1 {
            if self.allToDo.count == 0 {
                return 1

            } else {
                return allToDo.count

            }

        }
        return allToDo.count
        // 何も投稿されていない時の表示Cellを出すためにretarun1をしてる
    }
    
        
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //実際に[todos]のデータをリストに表示するメソッド
        //リストの行である Cell を作ってそれを返す処理

        
//        let section = Sections(rawValue: indexPath.section)
//
//        switch section {
//        case .explanation:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionTableViewCell
//            cell.titleLabel.text = "ToDoにはタイトルと詳細説明と終了日を設定することが出来ます"
//
//            return cell
//
//        case .todoList:
//             if self.allToDo.count == 0 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell") as! EmptyTableViewCell
//                cell.titleLabel.text = "何も投稿されていません"
//                return cell
//                // 何も表示されていない時の表示
//
//             } else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ToDoTableViewCell
//
//                let todo = allToDo[indexPath.row]
//                cell.cellTitleLabel?.text = todo.inTitle
//                cell.cellDetailLabel?.text = todo.inDetail
//                cell.cellCalenderLabel?.text = todo.inCalendar.convertDate()
//
//                return cell
//
//            }
//            case .none:
//            break
//
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ToDoTableViewCell
//        return cell
//        //ここで返さなきゃならない理由がわからない
//
//    }
        

                
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionTableViewCell

            cell.titleLabel.text = "ToDoにはタイトルと詳細説明と終了日を設定することが出来ます"

            return cell

        } else if indexPath.section == 1 {
            if self.allToDo.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell") as! EmptyTableViewCell

                cell.titleLabel.text = "何も投稿されていません"

                return cell
                    // 何も表示されていない時の表示
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ToDoTableViewCell

                let todo = allToDo[indexPath.row]
                cell.cellTitleLabel?.text = todo.inTitle
                cell.cellDetailLabel?.text = todo.inDetail
                cell.cellCalenderLabel?.text = todo.inCalendar.convertDate()

                return cell

            }

        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ToDoTableViewCell

        return cell

            }
        
        
        
        
        
        
        
        
        
        
        

//        if indexPath.section == 0 {
//            cell.cellTitleLabel?.text = "タイトルを入れます"
//            cell.cellDetailLabel?.text = "詳細を入れます"
//            cell.cellCalenderLabel?.text = "日付が入ります"
//
//        } else if indexPath.section == 1 {
//            let todo = allToDo[indexPath.row]
//
//            cell.cellTitleLabel?.text = todo.inTitle
//            cell.cellDetailLabel?.text = todo.inDetail
//            cell.cellCalenderLabel?.text = todo.inCalendar.convertDate()
//
//            }
//        //        cell.cellCalenderLabel = todo.inCalendar
//
////        cell.textLabel?.text = todo.inTitle
////        cell.detailTextLabel?.text = todo.inDetail
//        //Cell が何行目かに応じてメモの値を表示>indexPathh型
//
//        return cell
//
//    }
    

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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nc = storyboard.instantiateViewController(withIdentifier: "AddNavigationController") as! UINavigationController
        
        let addvc = nc.viewControllers[0] as! AddController
        
        let todo = allToDo[(tableView.indexPathForSelectedRow?.row)!]
        addvc.todo = todo

//        tableView.deselectRow(at: indexPath, animated: true)
        //ここで選択状態を解除すると、rewindTitleのguardメソッドが通らなくなり、編集できなくなるため無効化
        self.present(nc, animated: true, completion: nil)
        
        //ストーリーボードから識別子を持ってきて遷移先の画面を紐付けて、値を渡す作業
    
    }
    
}
