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
       
       
       array.append(MineCellModel())
       array.append(MineTabCellModel())
       array.append(MineSetupCellModel())


       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
         self.v_index(vId: INDEXID) { (index) in
             
            self.block?(array[index])

        }
        
    }
    
    
    
}
