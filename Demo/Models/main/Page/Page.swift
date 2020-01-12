
//
//  Page.swift
//  Demo
//
//  Created by apple on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class Page:Vue,V_ViewControllerProtocol{
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
        m.name = "单页"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            if m.v_identifier == 1{
                let vc = CodeViewController()
                vc.backCodeBlock { (str) in
                    
                    self.addTitle(str)
                }
                Router.currentController().navigationController?.pushViewController(vc, animated: false)
            }else{
                
               Alert.editorContent("请输入标题"){ (str) in
                   let code = CodeCache()
                   code.name = str
                   if code.cacheProject(){
                       
                       let a = BriefCellModel()
                       a.name = str
                       self.arrayContent.append(a)
                       self.dealContent()
                    

                       let p = PageDetails()
                       p.title = str
                       Router.push(p, nil, nil)
                       
                   }
                   
               }
                
            }
            
        }
        
    }
    private func addTitle(_ codes:String){
        
        print(codes)
        Alert.editorContent("请输入标题"){ (str) in
            let code = CodeCache()
            code.name = str
            if code.cacheProject(){
                
                let a = BriefCellModel()
                a.name = str
                self.arrayContent.append(a)
                CodeCache.cachePageContents(str, codes)
                self.dealContent()
            }
            
            

        }
    }
    private func dealContent(){

        self.arrayContent.removeAll()
//        self.arrayContent.append(HeadCellModel())
        
        let array = CodeCache.getCacheArray()
        for value in array{
            let a = BriefCellModel()
            a.name = value.name
            self.arrayContent.append(a)
        }
        
        
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
        
           let data = self.arrayContent[index]
           let number = data.v_identifier

          if data is BriefCellModel{
                 if number == 1{
                    self.arrayContent.remove(at: index)
                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                    }
                    CodeCache.remvoeCacheProject(index)

                 }else{
                    
                    let m = data as! BriefCellModel
                   
                    let p = PageDetails()
                    p.title = m.name
                    Router.push(p, nil, nil)
                    
                 }
               
           }
          
       }
        
         
        
    }
    private func mainCacheAppTitles(){
        
        var titles = [String]()
        for value in self.arrayContent{
            if value is BriefCellModel{
                let m = value as! BriefCellModel
                if let n = m.name{
                    titles.append(n)
                }
            }
        }
        App.instance.cacheAppTitles(titles)

    }
  
    
   
   
    
}
