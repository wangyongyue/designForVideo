//
//  BriefCell.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class BriefCell: UITableViewCell {
    
    lazy private var leftButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "delete"), for: .normal)
        return a
    }()
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let line:UIView = {
           let a = UIView()
           a.backgroundColor = UIColor.lightGray
           return a
       }()
    
    
    let tap = UITapGestureRecognizer()
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(line)
        self.contentView.addGestureRecognizer(self.tap)
        self.contentView.addSubview(leftButton)
        self.contentView.addSubview(headerLabel)

        leftButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-12)

        }
        headerLabel.snp.makeConstraints { (make) in
        
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(12)
            make.right.equalTo(-50)

        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)

        }
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is BriefCellModel{
            let m = aModel as! BriefCellModel
           
            headerLabel.text = m.name
  
            
            leftButton.v_click {
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
class BriefCellModel:VueData{
    
    var name:String?
    var data:VueData?

}

