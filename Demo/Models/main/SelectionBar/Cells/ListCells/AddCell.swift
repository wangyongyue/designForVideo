//
//  AddCell.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class AddCell: UITableViewCell {
    
    lazy private var leftButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "add"), for: .normal)
        return a
    }()
    let line:UIView = {
           let a = UIView()
           a.backgroundColor = UIColor.lightGray
           return a
       }()
    
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(line)

        self.contentView.addSubview(leftButton)
        leftButton.snp.makeConstraints { (make) in
            
            make.center.equalTo(self.contentView)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)

        }
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is AddCellModel{
            let m = aModel as! AddCellModel
            
            leftButton.v_click {
                m.v_to()
            }

        }
    }
    
}
class AddCellModel:VueData{
    
    var name:String?
  
}

