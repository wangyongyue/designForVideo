//
//  Content106Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//
import UIKit
import VueSwift
class Content106Cell: UITableViewCell {
    
   
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 15)
        a.text = "数据数据"
        return a
    }()
    
    lazy private var timeLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .right
        a.font = UIFont.boldSystemFont(ofSize: 15)
        a.textColor = UIColor.lightGray
        a.text = "数据数据"

        return a
    }()
    
    lazy private var zhuanButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "more"), for: .normal)
        return a
    }()
   
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.timeLabel)

        self.contentView.addSubview(self.zhuanButton)
        
        self.contentView.addSubview(self.deleteButton)

        self.deleteButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)

        }
       
        self.nameLabel.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(12)
        }
       
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-36)
        }
       
        self.zhuanButton.snp.makeConstraints { (make) in
            
           make.centerY.equalTo(self.contentView)
            make.right.equalTo(-12)
            
        }
       
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content106CellModel{
            
            let m = aModel as! Content106CellModel
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
class Content106CellModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 50
    }
}
