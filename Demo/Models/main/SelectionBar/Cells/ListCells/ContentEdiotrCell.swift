//
//  ContentEdiotrCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/12.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class ContentEdiotrCell: UITableViewCell {
    
  
    
    
    lazy private var headerLabel1:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据"
        a.numberOfLines = 1
        return a
    }()
    
    
    lazy private var headerLabel2:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据"
        a.numberOfLines = 1
        return a
    }()
    lazy private var field:UITextField = {
        let a = UITextField()
        a.textAlignment = .left
        a.placeholder = "请输入"
        a.borderStyle = .roundedRect
        return a
    }()
    
    
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.contentView.addSubview(self.headerLabel1)
        self.contentView.addSubview(self.headerLabel2)
        self.contentView.addSubview(self.field)

       

        self.headerLabel1.snp.makeConstraints { (make) in
            
            make.left.equalTo(12)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(100)

        }
        self.headerLabel2.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.headerLabel1.snp_rightMargin).offset(10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(60)

        }
        self.field.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.headerLabel2.snp_rightMargin).offset(12)
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-12)

        }
        
        
       
        self.contentView.addSubview(self.line)

        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.5)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(0)
            
        }
       
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is ContentEdiotr{
            
            let m = aModel as! ContentEdiotr
            
            if let a = m.key,let b = m.value{
                headerLabel1.text = "key：" + a
                headerLabel2.text = "value："
                field.text = b
            }
            field.v_change { [weak self] in
                
                m.value = self?.field.text
            }
            
        }
    }
}
class ContentEdiotr:VueData{
    
    var key:String?
    var value:String?

    convenience init(_ k:String?,_ v:String?){
        self.init()
        key = k
        value = v
    }
    
    
    override func v_height() -> CGFloat {
        
        return 50
    }
}
