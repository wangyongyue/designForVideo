//
//  HPage.swift
//  Demo
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class HPage:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()

    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
        dealStatus()
        dealNav()
        dealContent()
        
        
    }
    private func dealStatus(){
        
        self.v_if(vId: STATUSID) { () -> Bool? in
            
            return false
        }
        
    }
    private func dealNav(){
        
        let m = NavAddCellModel()
        m.name = "页面"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            if m.v_identifier == 1{
                           
                           
            }else if m.v_identifier == 2{
                           
                Alert.editorContent("请输入页面名称"){ (str) in
                    let p = PageCache()
                    p.name = str
                    if PageCache.cacheProject(p){
                        
                        self.dealContent()
                        let m = HPageAdd()
                        m.title = str
                        Router.push(m, nil, nil)
                    }
                    
                }
                           
            }
        }
        
    }
    private func dealContent(){

       self.arrayContent.removeAll()
       for value in PageCache.getCacheArray(){
           let a = BriefCellModel()
           a.name = value.name
           self.arrayContent.append(a)
       }

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
        
             let so = DataSource()
             so.sourceStr = "Soure1"
             let m = AutoPage()
             m.source = so
             Router.push(m, nil, nil)
        
             return
                
             let data = self.arrayContent[index] as! BriefCellModel
             if data.v_identifier == 1{
                self.arrayContent.remove(at: index)
                self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                    return self.arrayContent
                }
                 PageCache.remvoeCacheProject(index)

             }else{
                 let m = HPageAdd()
                 m.title = data.name
                 Router.push(m, nil, nil)
             }
        
        
        }
         
        
    }
    
   
   
    
}
