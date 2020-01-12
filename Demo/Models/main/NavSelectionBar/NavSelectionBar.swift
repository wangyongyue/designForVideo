//
//  NavSelectionBar.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
typealias VDataBlock = (VueData) -> ()
typealias VDicBlock = ([String:String]) -> ()

class NavSelectionBar:Vue{
    
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
       array.append(NavTitleCellModel())
       array.append(NavBackCellModel())
       array.append(NavMainCellModel())

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
            
         let data = array[index] as! VueData
         self.block?(data)
        self.view?.removeFromSuperview()
        
       }
        
    }
    
    
    
}
