//
//  PageDetails.swift
//  Demo
//
//  Created by apple on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class PageDetails:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    let bar = SelectionBar()
    var pe = PageDataEditor()

    var title:String?

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
    private func cacheContents(){
        
        var data = [Any]()
        var dataModel = [String]()
        for value in self.arrayContent{
            
            if let m = value as? AddCellModel{
                
            }else{
                
                let className = NSStringFromClass(value.classForCoder).replacingOccurrences(of: DataStyle.getAppName(), with: "")
                dataModel.append(className)
                
                if let a = value.vData{
                    
                    data.append(a)
                }

            }
        }
        
        let dic =  [
            "data":data,
            "dataModel":dataModel
        ]
        if (!JSONSerialization.isValidJSONObject(dic)) {
            return
        }
        let jsonData : NSData! = try? JSONSerialization.data(withJSONObject: dic, options: []) as NSData!
        let JSONString = NSString(data:jsonData as Data,encoding: String.Encoding.utf8.rawValue)
        
        if let str = self.title,let codes = JSONString as? String{

            CodeCache.cachePageContents(str, codes)
                           
        }
    }
    private func dealContent(){
        if let a = title{
            self.arrayContent = CodeCache.getPageContentsArrayWithData(a,false)
        }
      self.arrayContent.append(AddCellModel())

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
       }
        
       self.v_index(vId: INDEXID) { (index) in
           let data = self.arrayContent[index]
           self.pe.vdata = data
           let number = data.v_identifier
           if data is AddCellModel{
               
               self.bar.show { (data) in
                   
                   self.arrayContent.insert(data, at: self.arrayContent.count - 1)

                   self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                       return self.arrayContent
                              
                   }

                self.cacheContents()

                
               }
               
           }else{
               if number == 1{
                
                    self.arrayContent.remove(at:index)
                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                    }
                    self.cacheContents()
                   
               }else{
                   
                   self.pe.show { (dic) in
                       
                       data.loadData(dic, false)
                       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                           return self.arrayContent
                       }
                    
                       self.cacheContents()
                    
                   }
                   
                   
               }
               
               
           }
        
        
        
       }
        
         
        
    }
  
   
   
    
}
