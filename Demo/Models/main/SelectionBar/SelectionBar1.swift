
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
       
       array.append(Content201CellModel())
       array.append(Content202CellModel())
       array.append(Content105CellModel())

       array.append(Content203CellModel())
       array.append(Content204CellModel())
       array.append(Content205CellModel())
       
       
      

      

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
         
        self.v_index(vId: INDEXID) { (index) in
            self.block?(array[index])
        }
        
    }
    
    
    
}
