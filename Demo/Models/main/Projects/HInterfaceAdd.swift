//
//  HInterfaceAdd.swift
//  Demo
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class HInterfaceAdd:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var title:String?
    var page = HPageAlert()

    var iPage:InterfacePage?
    
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
        
        let m = NavBackCellModel()
        m.name = iPage?.name
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
        }
        
        
    }
    private func dealContent(){
        
        if let name = iPage?.name{
            self.arrayContent = PageCache.analysisCompenents(name)
        }
      
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
           
             if let p = self.iPage?.page{
                 
                let m = HInterfaceAdd()
                m.iPage = p
                Router.push(m, nil, nil)
                
             }else{
                
                self.page.show { (data) in
                    let p = InterfacePage()
                    let a = data as! TitleCellModel
                    p.name = a.name
                   
                    let m = HInterfaceAdd()
                    m.iPage = p
                    self.iPage?.page = p
                    
                    if let name = InterfaceCache.instance.name {
                        InterfaceCache.instance.interPage?.cachePage(name)

                    }
                    
                    Router.push(m, nil, nil)
                    
                }
             }
        
             
    
          
       }
        
         
        
    }
  
   
   
    
}
