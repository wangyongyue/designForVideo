//
//  Content104Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content104Cell: UITableViewCell {
    
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据"
        a.numberOfLines = 0
        return a
    }()
    
    lazy private var headerLabel1:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据"
        a.numberOfLines = 0
        return a
    }()
   
    
    lazy private var bigImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_13"))

        a.contentMode = .scaleAspectFill

        return a
    }()
    
    lazy private var bigImage1:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_14"))

        a.contentMode = .scaleAspectFill

        return a
    }()

    
    
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.bigImage)
        self.contentView.addSubview(self.bigImage1)

                
        self.contentView.addSubview(self.headerLabel)
        self.contentView.addSubview(self.headerLabel1)

        self.contentView.addSubview(self.deleteButton)

        
        
        self.contentView.addSubview(self.line)

        
        self.deleteButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)

        }
        
        let w = (Adapter.width() - 24 - 10)/2
        let h = w/3*2 - 30

        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.height.equalTo(h)
            make.width.equalTo(w)
            
        }
        self.bigImage1.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.right.equalTo(-12)
            make.height.equalTo(h)
            make.width.equalTo(w)
            
        }
        
       self.headerLabel.snp.makeConstraints { (make) in
           
           make.top.equalTo(self.bigImage.snp_bottomMargin).offset(20)
           make.left.equalTo(self.bigImage)
           make.right.equalTo(self.bigImage)
           
       }
        self.headerLabel1.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bigImage1.snp_bottomMargin).offset(20)
            make.left.equalTo(self.bigImage1)
            make.right.equalTo(self.bigImage1)
            
        }
        
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content104CellModel{
            let m = aModel as! Content104CellModel
            deleteButton.v_click{
                
                m.v_identifier = 1
                m.v_to()
            }

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Content104CellModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        let w = (Adapter.width() - 24 - 10)/2
        let h = w/3*2 - 30 + 50
        return  h
    }
}


