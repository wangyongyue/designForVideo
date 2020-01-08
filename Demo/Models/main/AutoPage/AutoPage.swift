//
//  AutoPage.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class AutoPage:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var title:String?
    var source:DataSource?

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
        m.name = title
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
        }
        
        
    }
    private func dealContent(){
        
        if let so = source{
            self.arrayContent = so.laodData()

        }
      
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
           
            
           if let so = self.source?.subSource{
                let m = AutoPage()
                m.source = so
                Router.push(m, nil, nil)
            }
            
       }
        
         
        
    }
  
   
   
    
}
