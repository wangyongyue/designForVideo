//
//  SPageAdd.swift
//  Demo
//
//  Created by apple on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class SPageAdd:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var title:String?
    var bar = SelectionBar()

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
        
        if let name = title{
            self.arrayContent = PageCache.analysisCompenents(name)
        }
        self.arrayContent.append(AddCellModel())

//        self.arrayContent = DataSource.readLocalData()

      
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
           
        
            let data = self.arrayContent[index] as! VueData
            let number = data.v_identifier
            if data is AddCellModel{
                
                self.bar.show { (data) in
                    
                    self.arrayContent.insert(data, at: self.arrayContent.count - 1)

                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                               
                    }

                    if let name = self.title{
                        PageCache.cacheCompenent(name, data)

                    }
                }
                
            }else{
                if number == 1{
                 
                     self.arrayContent.remove(at:index)
                     self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                         return self.arrayContent
                     }
                     if let name = self.title{
                         PageCache.deleteCacheCompenent(name, index)
                     }
                    
                }else{
                    
                    
                    
                }
                
                
            }
          
       }
        
         
        
    }
  
   
   
    
}
