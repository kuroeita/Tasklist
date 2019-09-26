//
//  SortViewController.swift
//  tasklist
//
//  Created by 黒川瑛太郎 on 2019/09/26.
//  Copyright © 2019 Eitaro Kurokawa. All rights reserved.
//

import UIKit



class SortViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sortnameCell = ["新着", "終了日"]

    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortnameCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sortcell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "sortcell") as! UITableViewCell

        cell.textLabel?.text = sortnameCell[indexPath.row]
        
        
        return cell
        
    }
    

    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
