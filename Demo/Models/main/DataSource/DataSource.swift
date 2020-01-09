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
    
    var sourceStr:String?
    var navigation:VueData?
    var subSource:DataSource?

    func laodDataNavigation() -> VueData{
        
        //读取本地的文件
        let path = Bundle.main.path(forResource: sourceStr!, ofType: "json");
        let url = URL(fileURLWithPath: path!)
        // 带throws的方法需要抛异常
        var datas = [VueData]()

        let data = try? Data(contentsOf: url)
        let jsonSource:Any = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
        Debug.log(jsonSource)
        if let map = jsonSource as? NSDictionary{
            
            if let navgation = map["navgation"] as? String{
            
                if navgation.count != 0{
                    Debug.log(navgation)
                    if let classType = NSClassFromString(DataStyle.getAppName() + navgation) as? VueData.Type {
                        let data = classType.init()
                        return data
                        
                    }
                }
            }
        }
          
                   
        return NavBackCellModel()

        
    }
    func laodData() -> [VueData]{
        
        //读取本地的文件
        let path = Bundle.main.path(forResource: sourceStr!, ofType: "json");
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
            if let subHttp = map["subHttp"] as? String{
                if subHttp.count != 0{
                    Debug.log(subHttp)
                    let so = DataSource()
                    so.sourceStr = subHttp
                    self.subSource = so
                }
            }
           
            
            for (index,value) in dataModels.enumerated(){
                let className = value as! String
                if let classType = NSClassFromString(DataStyle.getAppName() + className) as? VueData.Type {
                    let data = classType.init()
                    let dic = dataArray[index] as! [String:String]
                    data.loadData(dic)
                    datas.append(data)
                    
                    
                }
            }
          
        }
                   
        return datas

        
    }

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
                if let classType = NSClassFromString(DataStyle.getAppName() + className) as? VueData.Type {
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

