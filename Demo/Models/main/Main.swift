//
//  Main.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Main:Vue,V_ViewControllerProtocol{
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
        m.name = "原型设计"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            
        }
        
    }
    private func dealContent(){

       self.arrayContent.append(HeadCellModel())
      
        self.arrayContent += App.instance.analysisAppTitles()
        

       self.arrayContent.append(AddCellModel())

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
        
           let data = self.arrayContent[index] as! VueData
           let number = data.v_identifier

           if data is AddCellModel{
                if self.arrayContent.count >= 7{
                    
                    return Alert.show(str: "最多只能创建五个项目原型")
                }
                
                Alert.editorContent("请输入项目原型简介"){ (str) in
                    
                    for value in self.arrayContent{
                        if value is BriefCellModel{
                            let m = value as! BriefCellModel
                            if let n = m.name{
                                if n == str{
                                    return Alert.show(str: "项目名称不能相同")

                                }
                            }
                        }
                    }
                    
                    self.arrayContent.removeLast()
                    let a = BriefCellModel()
                    a.name = str
                    self.arrayContent.append(a)
                    self.arrayContent.append(AddCellModel())

                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                    }
                    
                    self.mainCacheAppTitles()
                }
            
           }else if data is BriefCellModel{
                 if number == 1{
                    self.arrayContent.remove(at: index)
                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                    }
                    self.mainCacheAppTitles()

                 }else{
                    
                    let m = data as! BriefCellModel
                    if let bar = m.data{

                        App.instance.tabBar = bar
                        App.instance.name = m.name
                        App.instance.analysisCache()
                        UIViewController.toHome()

//                        Alert.defaultImageStyle {
//                            
//
//                        }


                                               
                    }else{
                        

                        TabSelectionBar().show { (bar) in
                            
                            App.instance.tabBar = bar
                            App.instance.name = m.name
                            App.instance.analysisCache()
                            UIViewController.toHome()

//                            Alert.defaultImageStyle {
//                                
//
//                            }

                            
                        }
                        
                    }
                    
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
