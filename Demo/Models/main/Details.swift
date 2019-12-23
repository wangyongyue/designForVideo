//
//  Details.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class Details:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var r = Record()

    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
        dealStatus()
        dealNav()
        dealContent()
      
        r.array = self.arrayContent
    }
    private func dealStatus(){
        
        self.v_if(vId: STATUSID) { () -> Bool? in
            
            return false
        }
        
    }
    private func dealNav(){
        
        let m = NavBackCellModel()
        m.name = r.title
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
           
            
        }
        
    }
    private func dealContent(){
        if let array = self.r.array{
            for value in array{
                self.arrayContent.append(value)
            }
        }else{
            
            self.arrayContent.append(AddCellModel())

        }
      
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
           
        
            let data = self.arrayContent[index] as! VueData
            let number = data.v_identifier
            if data is AddCellModel{
                
                let bar = SelectionTabBar()
                bar.show { (data) in
                    
                    self.arrayContent[index] = data
                    self.arrayContent.append(AddCellModel())

                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                               
                    }
                    self.r.array = self.arrayContent

                }
                
            }else{
                if number == 1{
                 
                     self.arrayContent.remove(at:index)
                     self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                         return self.arrayContent
                                
                     }
                     self.r.array = self.arrayContent
                     return
                    
                }
                if let r = self.r.record{
                 
                     let m = Details()
                     m.r = r
                     Router.push(m, nil, nil)
                    
                }else{
                    Alert.editorContent("请输入标题"){ (str) in

                         let m = Details()
                         self.r.record = m.r
                         m.r.title = str
                         Router.push(m, nil, nil)
                                          
                                          
                    }
                 
                }
                
            }
          
       }
        
         
        
    }
  
   
   
    
}
