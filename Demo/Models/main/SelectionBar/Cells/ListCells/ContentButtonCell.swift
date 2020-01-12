//
//  ContentButtonCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/1/12.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class ContentButtonCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        label.backgroundColor = Configuration.instructions.themeColor()

        return label
    }()
    
    
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(headerLabel)
        self.contentView.addGestureRecognizer(tap)

        headerLabel.snp.makeConstraints { (make) in

            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)


        }
        

    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is ContentButton{
            let m = aModel as! ContentButton
           
            headerLabel.text = m.name
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
    
}
class ContentButton:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return 50
    }
    convenience init(_ a:String?) {
        self.init()
        self.name = a
    }
  
}

