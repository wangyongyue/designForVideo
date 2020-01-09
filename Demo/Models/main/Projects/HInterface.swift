
//
//  HInterface.swift
//  Demo
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class HInterface:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var page = HPageAlert()
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
        m.name = "模块"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            if m.v_identifier == 1{
                           
                           
            }else if m.v_identifier == 2{
                           
                Alert.editorContent("请输入模块名称"){ (str) in
                    let p = InterfaceCache()
                    p.name = str
                    if InterfaceCache.cacheProject(p){
                        
                        self.dealContent()
                    }
                    
                }
                           
            }
            
        }
        
    }
    private func dealContent(){

           self.arrayContent.removeAll()
           for value in InterfaceCache.getCacheArray(){
               let a = BriefCellModel()
               a.name = value.name
               self.arrayContent.append(a)
           }
           
           self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
               return self.arrayContent
                      
           }
            
           self.v_index(vId: INDEXID) { (index) in
            
                let data = self.arrayContent[index] as! BriefCellModel
                if data.v_identifier == 1{
                   self.arrayContent.remove(at: index)
                   self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                       return self.arrayContent
                   }
                    InterfaceCache.remvoeCacheProject(index)

                }else{
                    let dm = data as? BriefCellModel
                    if let name = dm?.name{
                       let p = InterfacePage.getCachePage(name)
                        if let title = p.name{
                            
                            let m = HInterfaceAdd()
                            m.iPage = p
                            Router.push(m, nil, nil)
                            
                        }else{
                            
                            self.page.show { (data) in
                                let ip = InterfacePage()
                                let a = data as! TitleCellModel
                                ip.name = a.name
                                let m = HInterfaceAdd()
                                m.iPage = ip
                                
                                InterfaceCache.instance.interPage = ip
                                InterfaceCache.instance.name = name
                                ip.cachePage(name)
                                
                                Router.push(m, nil, nil)
                                
                            }
                        }
                        
                    }
                    
                }
            
            }
             
            
    }
        
       
       
        
}
