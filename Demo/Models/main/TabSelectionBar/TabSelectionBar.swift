
//
//  TabSelectionBar.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class TabSelectionBar:Vue{
    
    private var block:VDataBlock?
    private var view:UIView?

    func show(_ ablock:@escaping VDataBlock){
        self.view = AlertTableView.init(self)
        self.block = ablock
    }
    
    override func v_start() {
                
        dealContent()
    }
   
    private func dealContent(){
        
       
       var array = [VueData]()
        
       array.append(TitleCellModel("选择模板类型"))
       array.append(TabHMCellModel())
       array.append(TabHMMCellModel())
       array.append(TabHHMMCellModel())
       array.append(TabHHSMMCellModel())

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
       }
        
       self.v_index(vId: INDEXID) { (index) in
            
        if index == 0{return}
        let data = array[index] as! VueData
         self.block?(data)
         self.view?.removeFromSuperview()
        
       }
        
    }
    
    
    
}
