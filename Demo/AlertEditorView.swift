//
//  AlertEditorView.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/12.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class AlertEditorView: UIView{

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
                   
                   make.top.equalTo(200)
                   make.left.equalTo(12)
                   make.right.equalTo(-12)
                   make.height.equalTo(200)
                   
               }
               table.layer.cornerRadius = 6
               table.layer.masksToBounds = true
        
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
