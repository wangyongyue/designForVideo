//
//  Record.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Record: NSObject {
    
    var title:String?
    var array:Array<VueData>?
    var record:Record?
    func toString() -> String{
        var dic = [String:String]()
        var arrayStr = ""
        var recordStr = ""
        var titleStr = ""

        if let arr = array{
            for value in arr{
                let className = NSStringFromClass(value.classForCoder)
                if arrayStr.count == 0{
                    arrayStr += "\(className)"
                }else{
                    arrayStr += ",\(className)"
                }
            }
        }
        
        dic["array"] = arrayStr
        if let r = record{
            recordStr = r.toString()
            dic["record"] = recordStr
        }
        dic["title"] = title
                   
        if (!JSONSerialization.isValidJSONObject(dic)) {
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dic, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    static func toClassModel(_ json:String) -> Record{
        let jsonStr = json.replacingOccurrences(of: "\\", with: "")
        let jsonData:Data = json.data(using: .utf8)!
        if let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers){
            if let map = dic as? [String:String]{
                
                let d = Record()
                 
                 if let arrayStr = map["array"]{
                    let strs = arrayStr.components(separatedBy: ",")
                    var types = [VueData]()
                    for value in strs{
                       if let classType = NSClassFromString(value) as? VueData.Type {
                        types.append(classType.init())
                        }
                    }
                    d.array = types
                 }
                 if let title = map["title"]{
                    d.title = title
                 }
                 if let recordStr = map["record"]{
                     d.record = toClassModel(recordStr)

                 }
                Debug.log(map)
                return d

                 
            }
            
        }
           
        return Record()
    }

}
class App: NSObject {
    
    static let instance = App()
    var array = [Record]()
    var tabBar:VueData?
    var name:String?

    func add(_ r:Record?){
        if let a = r{
            array.append(a)
        }
//        Debug.log(array)
    }
    func remove(_ r:Record?){
        if let a = r{
            let index = a.index(ofAccessibilityElement: array)
            array.remove(at: index)
        }
        
    }
    func removeAll(){
       array.removeAll()
    }
    func cacheAppTitles(_ titles:[String]){
        
        let userDefault = UserDefaults.standard
        if let appTitles = userDefault.stringArray(forKey: "AppTitles"){
            for value in appTitles{
                 var isH = false
                 for title in titles{
                    if value == title{
                        isH = true
                    }
                 }
                if isH ==  false{
                    userDefault.removeObject(forKey: "AppRecords\(value)")
                }
                   
            }
        }
        userDefault.set(titles, forKey: "AppTitles")
        Debug.log(titles)
        
    }
    func cache(){
        
        let userDefault = UserDefaults.standard
        if let bar = tabBar,let title = name{
            let className = NSStringFromClass(bar.classForCoder)
            userDefault.set(className, forKey: title)
            var records = [String]()
            for (index,value) in array.enumerated(){
                records.append(value.toString())
            }
            userDefault.set(records, forKey: "AppRecords\(title)")
            Debug.log(records)
        }
        
       
        
    }
    func analysisAppTitles() -> [VueData]{
        
        let userDefault = UserDefaults.standard
        var appTitles = [VueData]()
        if let titleArray = userDefault.stringArray(forKey: "AppTitles"){
            for value in titleArray{
                let a = BriefCellModel()
                a.name = value
                if let className = userDefault.string(forKey: value){
                    if let classType = NSClassFromString(className) as? VueData.Type {
                        a.data = classType.init()
                    }
                }
                appTitles.append(a)
            }
        }
        return appTitles
        
    }
    func analysisCache(){
        var array = [Record]()
        let userDefault = UserDefaults.standard
        if let title = name{
            if let records = userDefault.stringArray(forKey: "AppRecords\(title)"){
                for value in records {
                   let r = Record.toClassModel(value)
                   array.append(r)
                }
            }
        }
        App.instance.array = array
    }
    
    
    
}
