//
//  Content202Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content202Cell: UITableViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 12
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: "know_tou")
        return a
    }()
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.text = "数据数据"
        return a
    }()
    lazy private var toDoLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.textColor = UIColor.lightGray
        a.text = "数据数据"

        return a
    }()
    lazy private var timeLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .right
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.textColor = UIColor.lightGray
        a.text = "5分钟以前"

        return a
    }()
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据"
        a.numberOfLines = 0
        return a
    }()
    
    lazy private var zhuanButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "know_share"), for: .normal)
        a.setTitle("数据", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)

        return a
    }()
    
    lazy private var pinglunButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "know_pinglun"), for: .normal)
        a.setTitle("数据", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)

        return a
    }()
    
    lazy private var zanButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "know_zan"), for: .normal)
        a.setTitle("数据", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return a
    }()
    
    lazy private var bigImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_2"))
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
        
        self.contentView.addSubview(self.headImage)
        self.contentView.addSubview(self.bigImage)

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.toDoLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.headerLabel)

        self.contentView.addSubview(self.zhuanButton)
        self.contentView.addSubview(self.pinglunButton)
        self.contentView.addSubview(self.zanButton)
        
        self.contentView.addSubview(self.deleteButton)

        
        
        self.contentView.addSubview(self.line)

      
        self.deleteButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)

        }
        
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.height.equalTo(100)
            make.width.equalTo(80)
            
        }
       
      
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.bigImage)
            make.left.equalTo(self.bigImage.snp_rightMargin).offset(20)
            make.right.equalTo(-12)
            
        }
        self.toDoLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(self.bigImage.snp_rightMargin).offset(20)
            make.right.equalTo(-12)
            
            
        }
       
        
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.5)
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
        if aModel is Content202CellModel{
            
            let m = aModel as! Content202CellModel
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
class Content202CellModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}
