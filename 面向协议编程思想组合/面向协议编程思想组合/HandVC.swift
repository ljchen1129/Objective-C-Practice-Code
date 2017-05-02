//
//  HandVC.swift
//  面向协议编程思想组合
//
//  Created by 陈良静 on 2017/4/21.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {

    fileprivate lazy var back : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("返回", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        btn.sizeToFit()
        
        return btn
    }()
    
    
    fileprivate let hand = Hand()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
    
    }
}

// MARK: - Table view data source

extension HandVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hand.numberOfCards
    }
    
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
    let card = hand.cardAtPosition(index: indexPath.row)
//    cell.textLabel?.text = card.rank.description
//    cell.textLabel?.textColor = card.color
//    cell.detailTextLabel?.text = card.suit.description
        
    return cell
    }
}

// MARK: - Table view delegate

extension HandVC {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            hand.deleteCardAtIndex(index: indexPath.row)
            deleteRowAtIndexPath(indexPath: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        hand.moveCard(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
}

// MARK: - custom method

extension HandVC {
    //点击编辑按钮
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(addNewCard)
            )
            
        } else {
            navigationItem.leftBarButtonItem = navigationItem.backBarButtonItem
        }
    }
    
    fileprivate func insertToRow() {
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    fileprivate func deleteRowAtIndexPath(indexPath : IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}

// MARK: - event response

extension HandVC {
    @objc fileprivate func backBtnClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func addNewCard() {
        if hand.numberOfCards < 5 {
            hand.addNewCardsAtIndex(index: 0)
            insertToRow()
        }
    }
}


