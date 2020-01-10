//
//  HStyle.swift
//  Demo
//
//  Created by apple on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class HStyle:Vue,V_ViewControllerProtocol{
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
        
        let m = NavTitleCellModel()
        m.name = "组件样式"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
        }
        
        
    }
    private func dealContent(){

           self.arrayContent.removeAll()
           self.arrayContent.append(Content101(DataStyle.loadStyle(NSStringFromClass(Content101.classForCoder()))))
           self.arrayContent.append(Content102(DataStyle.loadStyle(NSStringFromClass(Content102.classForCoder()))))
           self.arrayContent.append(Content103(DataStyle.loadStyle(NSStringFromClass(Content103.classForCoder()))))
           self.arrayContent.append(Content104(DataStyle.loadStyle(NSStringFromClass(Content104.classForCoder()))))
           self.arrayContent.append(Content105(DataStyle.loadStyle(NSStringFromClass(Content105.classForCoder()))))
           self.arrayContent.append(Content106(DataStyle.loadStyle(NSStringFromClass(Content106.classForCoder()))))

           self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
               return self.arrayContent
                      
           }
            
           self.v_index(vId: INDEXID) { (index) in
            
            
            }
             
            
    }
        
       
       
        
}
