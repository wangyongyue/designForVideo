//
//  NavMainCell.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class NavMainCell: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    lazy private var leftButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "main"), for: .normal)
        return a
    }()
    let line:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.lightGray
        return a
    }()
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(leftButton)
        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(line)

        
        leftButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(15)
        }
       
        headerLabel.snp.makeConstraints { (make) in
            
            make.center.equalTo(self.contentView)
        }
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(-0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)

        }
           
    
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is NavMainCellModel{
            let m = aModel as! NavMainCellModel
            
            headerLabel.text = m.name
            
            leftButton.v_click {
                
                m.v_identifier = 1
                m.v_to()
            }
            

        }
    }
    
}
class NavMainCellModel:VueData{
    
    var name:String?
  
    override func v_height() -> CGFloat {
        
        return Adapter.topNavigation()
    }
}

