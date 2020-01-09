//
//  ProjectCache.swift
//  Demo
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class ProjectCache: NSObject {
    
    var name:String?
    static func cacheProject(_ p:ProjectCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in ProjectCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "项目名称相同，请修改")
                    return false
                }
                strings.append(a)
            }
            
        }
        if let a = p.name{
            
            strings.append(a)
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(ProjectCache.classForCoder()))
        return true
    }
    static func getCacheArray() -> [ProjectCache]{
        
        let userDefault = UserDefaults.standard
        var ps = [ProjectCache]()

        if let strings = userDefault.stringArray(forKey: NSStringFromClass(ProjectCache.classForCoder())){
            for value in strings{
                let m = ProjectCache()
                m.name = value
                ps.append(m)
            }
        }
        Debug.log(ps)
        return ps
    }
    
}
class PageCache: NSObject {
    
    var name:String?
    
    static func cacheProject(_ p:PageCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in PageCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "单页名称相同，请修改")
                    return false
                }
                strings.append(a)
            }
            
        }
        if let a = p.name{
            
            strings.append(a)
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(PageCache.classForCoder()))
        return true
    }
    static func remvoeCacheProject(_ n:Int) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for (index,value) in PageCache.getCacheArray().enumerated(){
            if index != n{
                if let a = value.name{
                    strings.append(a)

                }
            }
            
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(PageCache.classForCoder()))
        return true
    }
    static func getCacheArray() -> [PageCache]{
        
        let userDefault = UserDefaults.standard
        var ps = [PageCache]()

        if let strings = userDefault.stringArray(forKey: NSStringFromClass(PageCache.classForCoder())){
            for value in strings{
                let m = PageCache()
                m.name = value
                ps.append(m)
            }
        }
        Debug.log(ps)
        return ps
    }
    
    static func cacheCompenent(_ name:String,_ data:VueData){
        
        let userDefault = UserDefaults.standard
        var records = [String]()
        if let titleArray = userDefault.stringArray(forKey: NSStringFromClass(PageCache.classForCoder()) + name){
            for (index,value) in titleArray.enumerated(){
                records.append(value)
            }
        }
        records.append(NSStringFromClass(data.classForCoder))
        
        userDefault.set(records, forKey: NSStringFromClass(PageCache.classForCoder()) + name)
        Debug.log(records)
        
    }
    static func deleteCacheCompenent(_ name:String,_ number:Int){
        
        let userDefault = UserDefaults.standard
        var records = [String]()
        if let titleArray = userDefault.stringArray(forKey: NSStringFromClass(PageCache.classForCoder()) + name){
            for (index,value) in titleArray.enumerated(){
                if index != number{
                    records.append(value)
                }
            }
        }
        
        userDefault.set(records, forKey: NSStringFromClass(PageCache.classForCoder()) + name)
        Debug.log(records)
        
    }
    static func analysisCompenents(_ name:String) -> [VueData]{
        
        let userDefault = UserDefaults.standard
        var appTitles = [VueData]()
        if let titleArray = userDefault.stringArray(forKey: NSStringFromClass(PageCache.classForCoder()) + name){
            Debug.log(titleArray)

            for value in titleArray{
                if let classType = NSClassFromString(value) as? VueData.Type {
                    let data = classType.init()
                    if let dic = DataStyle.loadStyle(value){
                        data.loadData(dic)
                    }
                    appTitles.append(data)
                }
            }
        }
        return appTitles
        
    }
}

class InterfacePage :NSObject{
    
    var name:String?
    var page:InterfacePage?
    func sequencePages() -> String{
        var dic = [String:String]()
        dic["name"] = self.name
        if let p = self.page{
            
            dic["page"] = p.sequencePages()
        }
        if (!JSONSerialization.isValidJSONObject(dic)) {
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dic, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    static func analysisPages(_ json:String) -> InterfacePage{
        
        let jsonStr = json.replacingOccurrences(of: "\\", with: "")
        let jsonData:Data = json.data(using: .utf8)!
        if let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers){
            if let map = dic as? [String:String]{
                
                let d = InterfacePage()
                if let name = map["name"]{
                   d.name = name
                }
                if let page = map["page"]{
                    d.page = analysisPages(page)
                }
                Debug.log(map)
                return d

            }
            
        }
        return InterfacePage()
        
    }
    
    func cachePage(_ name:String){
        
        let userDefault = UserDefaults.standard
        let str = self.sequencePages()
        userDefault.set(str, forKey: NSStringFromClass(InterfacePage.classForCoder()) + name)
        Debug.log(str)
        
        
    }
    static func getCachePage(_ name:String) -> InterfacePage{
        
        let userDefault = UserDefaults.standard
        if let string = userDefault.string(forKey: NSStringFromClass(InterfacePage.classForCoder()) + name){
            Debug.log(string)
            let page = InterfacePage.analysisPages(string)
            return page
        }
        return InterfacePage()
    }
}

class InterfaceCache: NSObject {
    
    static let instance = InterfaceCache()

    var name:String?
    var interPage:InterfacePage?
    
    static func cacheProject(_ p:InterfaceCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in InterfaceCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "模块名称相同，请修改")
                    return false
                }
                strings.append(a)
            }
            
        }
        if let a = p.name{
            
            strings.append(a)
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(InterfaceCache.classForCoder()))
        return true
    }
    static func getCacheArray() -> [InterfaceCache]{
        
        let userDefault = UserDefaults.standard
        var ps = [InterfaceCache]()

        if let strings = userDefault.stringArray(forKey: NSStringFromClass(InterfaceCache.classForCoder())){
            for value in strings{
                let m = InterfaceCache()
                m.name = value
                ps.append(m)
            }
        }
        Debug.log(ps)
        return ps
    }
    
    static func remvoeCacheProject(_ n:Int) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for (index,value) in InterfaceCache.getCacheArray().enumerated(){
            if index != n{
                if let a = value.name{
                    strings.append(a)

                }
            }
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(InterfaceCache.classForCoder()))
        return true
    }
    
   
    
    
}
