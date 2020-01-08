//
//  DataSource.swift
//  Demo
//
//  Created by apple on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift

class DataSource: NSObject {

    static func readLocalData() -> [VueData]{
        
        //读取本地的文件
        let path = Bundle.main.path(forResource: "Soure", ofType: "json");
        let url = URL(fileURLWithPath: path!)
        // 带throws的方法需要抛异常
        var datas = [VueData]()

        let data = try? Data(contentsOf: url)
        let jsonSource:Any = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
        Debug.log(jsonSource)
        if let map = jsonSource as? NSDictionary{
            let dataArray = map["data"] as! NSArray
            Debug.log(dataArray)
            let dataModels = map["dataModel"] as! NSArray
            Debug.log(dataModels)
            
            for (index,value) in dataModels.enumerated(){
                let className = value as! String
                if let classType = NSClassFromString("Demo." + className) as? VueData.Type {
                    let data = classType.init()
                    let dic = dataArray[index] as! [String:String]
                    data.loadData(dic)
                    datas.append(data)
                    
                    
                }
            }
          
        }
                   
        return datas

        
    }
    
}

