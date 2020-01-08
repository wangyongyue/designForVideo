//
//  BannerSubCell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class BannerSubCell: UICollectionViewCell {
    
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
        a.textColor = UIColor.white
        a.numberOfLines = 1
        a.font = UIFont.boldSystemFont(ofSize: 15)
        return a
    }()
   
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
    
    lazy private var dianImagae:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "dian")
        a.backgroundColor = UIColor.clear
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
        
        self.contentView.addSubview(self.line)
        
        
        self.contentView.addSubview(self.dianImagae)
        self.dianImagae.snp.makeConstraints { (make) in

            make.centerX.equalTo(self.contentView)
            make.bottom.equalTo(-10)
            
        }
        

        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.bottom.equalTo(-12)
            make.right.equalTo(-12)
            
        }
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)

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
        if aModel is BannerSubCellModel{
            
            let m = aModel as! BannerSubCellModel
            headImage.image = m.img
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class BannerSubCellModel:VueData{
    
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

