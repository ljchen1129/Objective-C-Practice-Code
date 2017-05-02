//
//  CategoryModel.swift
//  iOS架构模式—MVP（Swift）
//
//  Created by 陈良静 on 2017/4/30.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import Foundation

struct Category {
    var name : String
    var count : Int
    var id : String
    
    func requsetCategoryData(WithName name: String, pwd: String, callBack: @escaping (_ resonse : Any)-> Void ) -> Void {
        
        HttpUtil.getRequset(WithUrl:"http://api.budejie.com/api/api_open.php?a=category&c=subscribe", callBack: callBack)
    }
}

