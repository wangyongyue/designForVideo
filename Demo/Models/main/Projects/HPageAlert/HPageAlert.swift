//
//  HPageAlert.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class HPageAlert:Vue{
    
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
        
       
       var array = Array<VueData>()

        for value in CodeCache.getCacheArray(){
            let a = TitleCellModel()
            a.name = value.name
            array.append(a)
        }
        
 
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
            
        let a = array[index]
        self.block?(a)
        self.view?.removeFromSuperview()
        
       }
        
    }
    
    
    
}
