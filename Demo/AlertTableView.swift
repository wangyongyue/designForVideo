//
//  AlertTableView.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class AlertTableView: UIView{

    convenience init(_ m:Vue) {
        self.init()
                
        self.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        let window = UIApplication.shared.keyWindow
        self.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(self)
               
        let table = CTable()
        self.addSubview(table)
        table.backgroundColor = Configuration.instructions.backgroundColor()
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(300)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        m.v_start()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
}
