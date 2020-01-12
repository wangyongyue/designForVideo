//
//  NavBackResetCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/12.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit

import VueSwift
class NavBackResetCell: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let backImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "back")
        return a
    }()
    let line:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.lightGray
        return a
    }()
    
    lazy private var rightButton:UIButton = {
        let a = UIButton()
        a.setTitle("重置", for: .normal)
        a.setTitleColor(UIColor.red, for: .normal)
        return a
    }()
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = UIColor.clear
    self.contentView.addSubview(headerLabel)
    self.contentView.addSubview(backImage)
    self.contentView.addSubview(line)
    self.contentView.addSubview(rightButton)

    

    if Configuration.instructions.tabBarBackgroundColor() == UIColor.black{
        backImage.image = UIImage.init(named: "back_w")
    }

    headerLabel.snp.makeConstraints { (make) in
        
        make.center.equalTo(self.contentView)
    }
    backImage.snp.makeConstraints { (make) in
        make.left.equalTo(10)
        make.centerY.equalTo(self.contentView)

    }
    let tap = UITapGestureRecognizer()
    backImage.isUserInteractionEnabled = true
    backImage.addGestureRecognizer(tap)
    tap.v_tap {
        
        Router.pop(nil)
    }
    line.snp.makeConstraints { (make) in
        make.bottom.equalTo(-0.5)
        make.left.equalTo(0)
        make.right.equalTo(0)
        make.height.equalTo(0.5)

    }
    rightButton.snp.makeConstraints { (make) in
        make.centerY.equalTo(self.contentView)
        make.right.equalTo(-15)
    }
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is NavBackResetCellModel{
            let m = aModel as! NavBackResetCellModel
            
            headerLabel.text = m.name

            rightButton.v_click {
                
                m.v_to()
            }
        }
    }
    
}
class NavBackResetCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        
        return Adapter.topNavigation()
    }
  
}

