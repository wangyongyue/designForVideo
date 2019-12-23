//
//  Content204Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content204Cell: UITableViewCell {
    
    lazy private var deleteButton:UIButton = {
         let a = UIButton()
         a.setImage(UIImage.init(named: "file_delete"), for: .normal)
         a.backgroundColor = UIColor.clear
         return a
     }()
     
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据数据数据数据数据数据数据数据数据数据数据数据数据"
        a.numberOfLines = 0
        return a
    }()
    
     lazy private var timeLabel:UILabel = {
         let a = UILabel()
         a.textAlignment = .right
         a.font = UIFont.boldSystemFont(ofSize: 12)
         a.textColor = UIColor.lightGray
         a.text = "数据数据"

         return a
     }()
     
     
     lazy private var bigImage:UIImageView = {
         let a = UIImageView()
         a.layer.cornerRadius = 6
         a.layer.masksToBounds = true
         a.image = UIImage.init(named: Image.fillImage("feng_5"))
         a.contentMode = .scaleAspectFill
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
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         self.contentView.addSubview(self.bigImage)

         self.contentView.addSubview(self.nameLabel)
         self.contentView.addSubview(self.timeLabel)
         
         self.contentView.addSubview(self.deleteButton)

         
         
         self.contentView.addSubview(self.line)

        
         
         self.nameLabel.snp.makeConstraints { (make) in
             make.top.equalTo(20)
             make.left.equalTo(12)
             make.right.equalTo(-12)
         }
         
         
         self.bigImage.snp.makeConstraints { (make) in
             
             make.top.equalTo(self.nameLabel.snp_bottomMargin).offset(20)
             make.right.equalTo(-12)
             make.left.equalTo(12)
             make.height.equalTo(130)
             
         }
         self.timeLabel.snp.makeConstraints { (make) in
             
              make.top.equalTo(self.bigImage.snp_bottomMargin).offset(20)
              make.left.equalTo(self.nameLabel)
             
         }
        
         
         
         self.deleteButton.snp.makeConstraints { (make) in
             
             make.top.equalTo(0)
             make.right.equalTo(0)

         }
         self.line.snp.makeConstraints { (make) in
             
            make.height.equalTo(0.5)
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
        if aModel is Content204CellModel{
            
            let m = aModel as! Content204CellModel
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
class Content204CellModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 260
    }
}
