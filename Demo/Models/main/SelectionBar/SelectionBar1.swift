
//
//  SelectionBar1.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class SelectionBar1:Vue,GetViewProtocol{
    
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
      array.append(BannerCellModel())
       
       
       array.append(Content101())
       array.append(Content102())
       array.append(Content103())
       array.append(Content104())
       array.append(Content105())
       array.append(Content106())
       


      

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
