//
//  CategoryTableView.swift
//  iOS架构模式—MVP（Swift）
//
//  Created by 陈良静 on 2017/4/30.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

class CategoryTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var dataArray:[Category] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    override func awakeFromNib() {
        self.delegate = self;
        self.dataSource = self;
    }

}

// Mark: UITableViewDataSource

extension CategoryTableView {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
        }
        let category = dataArray[indexPath.row]
        cell?.textLabel?.text = category.name
        cell?.detailTextLabel?.text = String(category.count)
        
        return cell!
        
    }
}
