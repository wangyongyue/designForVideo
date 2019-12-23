//
//  Content300Cell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content300Cell: UICollectionViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_1"))
        a.contentMode = .scaleAspectFill
        return a
    }()
    
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据数据数据数据数据"
        a.numberOfLines = 1
        a.font = UIFont.boldSystemFont(ofSize: 13)
        return a
    }()
    
    lazy private var timeLabel:UILabel = {
           let a = UILabel()
           a.textAlignment = .left
           a.text = "数据数据数据数据数据"
           a.numberOfLines = 1
           a.textColor = UIColor.lightGray
           a.font = UIFont.boldSystemFont(ofSize: 13)

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
    override init(frame: CGRect) {
    super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.headImage)
        
       
        self.contentView.addSubview(self.headerLabel)
        self.contentView.addSubview(self.timeLabel)

        
        self.contentView.addSubview(self.line)

        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.bottom.equalTo(-60)
            make.right.equalTo(-12)
            
        }
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(15)
            make.right.equalTo(-12)
            make.left.equalTo(12)

        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(12)
            make.right.equalTo(-12)

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
        if aModel is Content300CellModel{
            
            let m = aModel as! Content300CellModel
            headImage.image = m.img
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Content300CellModel:VueData{
    
    var name:String?
    var img:UIImage?
    convenience init(_ imgName:String) {
        self.init()
        img = UIImage.init(named: imgName)
    }
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}

