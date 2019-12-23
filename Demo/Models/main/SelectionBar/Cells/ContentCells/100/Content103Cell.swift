//
//  Content103Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//
import UIKit
import VueSwift
class Content103Cell: UITableViewCell {
    
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var bigenButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "start"), for: .normal)
        return a
    }()
    
    lazy private var bigImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: Image.fillImage("feng_15"))
//        a.contentMode = .scaleAspectFill

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
        self.contentView.addSubview(self.bigenButton)
        self.contentView.addSubview(self.deleteButton)
        self.contentView.addSubview(self.line)

        self.deleteButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(0)
        }
        
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(260)
        }
      
        self.bigenButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.bigImage)
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
        if aModel is Content103CellModel{
            
            let m = aModel as! Content103CellModel
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
class Content103CellModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 260
    }
}

