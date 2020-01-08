//
//  SelectionBar.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class SelectionBar:Vue{
    
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
        
        
//        array.append(BannerCellModel())
        array.append(Content101(DataStyle.loadStyle(NSStringFromClass(Content101.classForCoder()))))
        array.append(Content102(DataStyle.loadStyle(NSStringFromClass(Content102.classForCoder()))))
        array.append(Content103(DataStyle.loadStyle(NSStringFromClass(Content103.classForCoder()))))
        array.append(Content104(DataStyle.loadStyle(NSStringFromClass(Content104.classForCoder()))))
        array.append(Content105(DataStyle.loadStyle(NSStringFromClass(Content105.classForCoder()))))
        array.append(Content106(DataStyle.loadStyle(NSStringFromClass(Content106.classForCoder()))))


       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
            
        let a = array[index]
        if let classType = a.classForCoder as? VueData.Type {
            let model = classType.init()
            if let dic = DataStyle.loadStyle(NSStringFromClass(a.classForCoder)){
                model.loadData(dic)
            }
            self.block?(model)
        }
        
       }
        
    }
    
    
    
}
