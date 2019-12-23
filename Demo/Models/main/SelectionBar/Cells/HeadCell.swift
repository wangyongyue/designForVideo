//
//  HeadCell.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class HeadCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let subLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
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
        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(subLabel)
       
        headerLabel.snp.makeConstraints { (make) in
        
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.right.equalTo(-12)

        }
        subLabel.snp.makeConstraints { (make) in
        
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.right.equalTo(-12)

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
        if aModel is HeadCellModel{
            let m = aModel as! HeadCellModel
           
            headerLabel.text = "欢迎使用快速原型设计"
            subLabel.text = "谢谢您使用快速原型设计！请点击 + 开始使用"

        }
    }
    
}
class HeadCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return 100
    }
  
}

