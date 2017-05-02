

//
//  HttpUtils.swift
//  iOS架构模式—MVP（Swift）
//
//  Created by 陈良静 on 2017/4/30.
//  Copyright © 2017年 陈良静. All rights reserved.
//

import Foundation

typealias callBack = (_ resopnse : Any) -> Void

public class HttpUtil {
    
    static func getRequset(WithUrl urlStrig: String, callBack: @escaping callBack) -> Void {
        // 1. 创建URL
        let urlO = URL(string: urlStrig)
        
        guard let url = urlO else {
            return
        }
        // 2.创建请求参数集合
        var requset = URLRequest(url: url)
        
        // 3. 设置请求方式
        requset.httpMethod = "GET"
        
        // 4. 创建请求会话
        let session = URLSession.shared
        
        // 5. 创建一个请求任务
        
        let dask = session.dataTask(with: requset) { (Data?, URLResponse?, Error?) in
//            guard let error = <#Error?#> else { print(\(error)) return }
            
            let dict = JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String, Any>
            throw {
                print("")
            }
            callBack(dict)
        }
        
         // 6. 执行任务
        dask.resume()
        
    }
    
}
