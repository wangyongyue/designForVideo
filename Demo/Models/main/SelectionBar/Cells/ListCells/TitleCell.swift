//
//  TitleCell.swift
//  Demo
//
//  Created by apple on 2019/12/4.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class TitleCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    let line:UIView = {
           let a = UIView()
           a.backgroundColor = UIColor.lightGray
           return a
       }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(line)
        self.contentView.addSubview(headerLabel)
       self.contentView.addGestureRecognizer(tap)

        headerLabel.snp.makeConstraints { (make) in
        
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.right.equalTo(-12)

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
        if aModel is TitleCellModel{
            let m = aModel as! TitleCellModel
           
            headerLabel.text = m.name
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
    
}
class TitleCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return 50
    }
    convenience init(_ a:String?) {
        self.init()
        self.name = a
    }
  
}

