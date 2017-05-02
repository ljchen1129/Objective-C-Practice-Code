//
//  CategoryPresenter.swift
//  iOS架构模式—MVP（Swift）
//
//  Created by 陈良静 on 2017/5/1.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import Foundation

var categoryM : Category?

var categoryT : AnyClass?


func attchView(_ view: AnyClass) -> Void {
    categoryT = view
}

func detachView() {
    categoryT = nil
}

func categoryTableViewRequsetData(WithName name : String, pwd : String) -> Void  {
    categoryM?.requsetCategoryData(WithName: name, pwd: pwd, callBack: {(_ resonse : Any) in
        
    }
}
