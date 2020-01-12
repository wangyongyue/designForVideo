//
//  DataStyle.swift
//  Demo
//
//  Created by apple on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift

class DataStyle: NSObject {
    var style = [String:Any]()
    static let sharedInstance: DataStyle = {
        let instance = DataStyle()
        return instance
    }()
    
    
    static func getAppName() -> String{
        
        let infoDictionary = Bundle.main.infoDictionary!
        let appDisplayName = infoDictionary["CFBundleDisplayName"] as! String
        
        return appDisplayName + "."
    }
    
    static func loadStyle(_ className:String) -> [String:String]?{
        
        //读取本地的文件
        var jsonSource:Any?
        if let source = DataStyle.sharedInstance.style[className]{
            jsonSource = source

        }else{
            
            let path = Bundle.main.path(forResource: "Style1", ofType: "json");
            let url = URL(fileURLWithPath: path!)
            let data = try? Data(contentsOf: url)
            jsonSource = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            
        }
        
//        Debug.log(jsonSource)
        if let map = jsonSource as? NSDictionary{
            let dic = map["data"] as! NSDictionary
            if let cName = className.components(separatedBy: ".").last{
                if let value = dic[cName] as? [String:String]{
                    return value
                }
            }
        }
        
        return nil
        
    }

}
