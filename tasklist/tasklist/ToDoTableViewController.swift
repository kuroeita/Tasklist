//
//  ToDoTableViewController.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/04.
//  Copyright © 2019年 Eitaro Kurokawa. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todos = [String]()

    @IBAction func rewindTitle(sender: UIStoryboardSegue) {
        //saveを押してセグエを巻き戻す際に実行されるメソッド
        guard let previousTitle = sender.source as? ToDoTableViewController, let todo = previousTitle.title else {
            //prepareから渡ってくるtitle.textを取得する
            return
        }
        self.todos.append(title)
        //条件を通った場合、titleから割ったてきた値をtodosに入れる
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        //リストがいくつのセクションに別れているかを返す
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.todos.count
        //何行か行数を返す
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        //実際に[todos]のデータをリストに表示するメソッド
        //リストの行である Cell を作ってそれを返す処理

        // Configure the cell...
        cell.textLabel?.text = self.todos[indexPath.row]
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

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
