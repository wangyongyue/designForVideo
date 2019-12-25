//
//  SelectionTabBar.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class SelectionTabBar:Vue{
    
    private var block:VDataBlock?
    private var view:UIView?
    func show(_ ablock:@escaping VDataBlock){
        
        self.view = AlertMenuView.init(self, 3)
        self.block = ablock
    }
    override func v_start() {
        dealTab()
        dealContent()
    }
            
    private func dealTab(){
        let titles = ["c1","c2","c3"]
        var array = [VueData]()
        for value in titles {
            let m = TabHeaderLineCellModel()
            m.name = value
            array.append(m)
        }
        
        self.v_array(vId: TABID) { () -> Array<VueData>? in
            
            return array
        }
    }
        
    private func dealContent(){
        
        var views = [GetViewProtocol]()
        
        let bar1 = SelectionBar1()
        let bar2 = SelectionBar2()
        let bar3 = SelectionBar3()
        views.append(bar1)
        views.append(bar2)
        views.append(bar3)
        
       
        bar1.choiceData { (data) in
            self.block?(data)

//            self.v_if(vId: SUPERVIEWREMOVE) { () -> Bool? in
//                return true
//            }
        }
        bar2.choiceData { (data) in
            self.block?(data)

//            self.v_if(vId: SUPERVIEWREMOVE) { () -> Bool? in
//                return true
//            }
        }
        bar3.choiceData { (data) in
            self.block?(data)

//            self.v_if(vId: SUPERVIEWREMOVE) { () -> Bool? in
//                return true
//            }
        }
        

        var contentArray = [VueData]()
        for (index,value) in views.enumerated(){
            let m = TabContentCellModel()
            m.view = value.getView()
            if index == 0{
                m.view?.viewLoad()
                m.isL = true
                
            }
            contentArray.append(m)
        }
        
        self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
            
            return contentArray
            
        }
        
        self.v_index(vId: TABINDEXID) { (index) in
            
            let v = contentArray[index] as! TabContentCellModel
            if v.isL == false{
                v.view?.viewLoad()
                v.isL = true
                
            }
            
        }
    }
    
      
       
       
        
}

