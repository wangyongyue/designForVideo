//
//  MineTabSubCell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MineTabSubCell: UICollectionViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "mine_head")
        a.contentMode = .scaleAspectFill
        return a
    }()
    
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.font = UIFont.boldSystemFont(ofSize: 14)
        a.text = "数据数据"
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
        
        self.contentView.addSubview(self.line)
        
   

        self.headImage.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(0)

        }
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)

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
        if aModel is MineTabSubCellModel{
            
            let m = aModel as! MineTabSubCellModel
            headImage.image = m.img
            headerLabel.text = m.name

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MineTabSubCellModel:VueData{
    
    var name:String?
    var img:UIImage?
    convenience init(_ imgName:String,_ aname:String) {
        self.init()
        img = UIImage.init(named: imgName)
        name = aname
    }
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}

