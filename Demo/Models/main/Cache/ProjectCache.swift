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
                    Alert.show(str: "页面名称相同，请修改")
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


class InterfaceCache: NSObject {
    
    var name:String?
    
    static func cacheProject(_ p:InterfaceCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in InterfaceCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "接口名称相同，请修改")
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
    
}
