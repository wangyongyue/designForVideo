//
//  NavTitleCell.swift
//  Demo
//
//  Created by apple on 2019/11/13.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class NavTitleCell: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let rightButton:UIButton = {
        let a = UIButton()
        a.backgroundColor = UIColor.clear
        a.setImage(UIImage.init(named: "add_r"), for: .normal)
        return a
    }()
    let leftButton:UIButton = {
        let a = UIButton()
        a.backgroundColor = UIColor.clear
        a.setImage(UIImage.init(named: "sao"), for: .normal)
        return a
    }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(rightButton)
        self.contentView.addSubview(leftButton)

        headerLabel.snp.makeConstraints { (make) in
            
            make.center.equalTo(self.contentView)
        }
        rightButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-10)
        }
        leftButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(10)
        }
        
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is NavTitleCellModel{
            let m = aModel as! NavTitleCellModel
            
            headerLabel.text = m.name
            rightButton.v_click {
                m.v_identifier = 2
                m.v_to()
            }
            leftButton.v_click {
                m.v_identifier = 1
                m.v_to()
            }

        }
    }
    
}
class NavTitleCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        
        return Adapter.topNavigation()
    }
  
}

