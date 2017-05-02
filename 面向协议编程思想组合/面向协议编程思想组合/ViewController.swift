//
//  ViewController.swift
//  面向协议编程思想组合
//
//  Created by 陈良静 on 2017/4/21.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var btn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("纸牌", for: .normal)
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 30))
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.center = self.view.center
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        return btn
    }()
    
    fileprivate let hand = Hand()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(btn)
        
        
    }
}

extension ViewController {
    @objc fileprivate func btnClick() {
        
        let vc = HandVC(style: .plain);
        self.navigationController?.pushViewController(vc, animated: <#T##Bool#>)
    }
}

