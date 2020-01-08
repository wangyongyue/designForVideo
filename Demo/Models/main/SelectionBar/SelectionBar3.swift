//
//  SelectionBar3.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class SelectionBar3:Vue,GetViewProtocol{
    
    private var block:VDataBlock?
    func choiceData(_ ablock:@escaping VDataBlock){
        
        self.block = ablock

    }
    func getView() -> ViewLoadProtocol {
        let v = TableView.init(self)
        return v
    }
    
    override func v_start() {
                
        dealContent()
      
    }
   
    private func dealContent(){
        
       var array = [VueData]()
       
       array.append(Content301CellModel())
       array.append(Content302CellModel())
       array.append(Content303CellModel())
       


       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
         self.v_index(vId: INDEXID) { (index) in
             
            let a = array[index]
            if let classType = a.classForCoder as? VueData.Type {
                self.block?(classType.init())
            }

        }
        
    }
    
    
    
}
