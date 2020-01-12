//
//  PageDataEditor.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/12.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class PageDataEditor:Vue{
    
    private var block:VDicBlock?
    private var view:UIView?
    var vdata:VueData?
    func show(_ ablock:@escaping VDicBlock){
        self.view = AlertEditorView.init(self)
        self.block = ablock
    }
    
    override func v_start() {
                
        dealContent()
      
    }
   
    private func dealContent(){
        
       
       var array = Array<VueData>()
        
        if let data = vdata{
            let str = NSStringFromClass(data.classForCoder).replacingOccurrences(of: DataStyle.getAppName(), with: "")
            if let keys = getComponentsConfig()[str] as? [String]{
                for value in keys{
                    if let d = vdata?.vData{
                        
                        array.append(ContentEdiotr.init(value, d[value]))

                    }
                }
                
            }
        }
       
        array.append(ContentButton.init("确定"))

        
        
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
           
        for value in array{
            if let a = value as? ContentEdiotr{
                if let key = a.key{
                    self.vdata?.vData?[key] = a.value
                }
            }
        }
        if let data = self.vdata?.vData{
            Debug.log(data)
            self.block?(data)
        }
        self.view?.removeFromSuperview()
        
       }
        
    }
    private func getComponentsConfig() -> [String:Any]{
        
        let a = [
            
            "Content101":["title","source"],
            "Content102":["title","source"],
            "Content103":["title","source"],
            "Content104":["title","source","subTitle"],
            "Content105":["title","source"],
            "Content106":["title","source"],

        ]
            
        return a
    }
    
    
    
}
