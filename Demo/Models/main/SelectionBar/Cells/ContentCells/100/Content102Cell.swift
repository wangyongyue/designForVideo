//
//  Content102Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content102Cell: UITableViewCell {
    
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var headerLabel1:UILabel = {
         let a = UILabel()
         a.textAlignment = .left
         a.text = "数据数据数据数据"
         a.numberOfLines = 1
         return a
     }()
     
     
     lazy private var headerLabel2:UILabel = {
         let a = UILabel()
         a.textAlignment = .left
         a.text = "数据数据数据数据"
         a.numberOfLines = 1
         return a
     }()
     
     lazy private var bigImage:UIImageView = {
         let a = UIImageView()
         a.layer.cornerRadius = 6
         a.layer.masksToBounds = true
         a.image = UIImage.init(named: Image.fillImage("che2"))

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
         
         self.contentView.addSubview(self.headerLabel1)
         self.contentView.addSubview(self.headerLabel2)

        

         let w = 80

         self.bigImage.snp.makeConstraints { (make) in
             
             make.top.equalTo(20)
             make.right.equalTo(-12)
             make.height.equalTo(w)
             make.width.equalTo(w)
             
         }
        
         self.headerLabel1.snp.makeConstraints { (make) in
             
             make.left.equalTo(12)
             make.top.equalTo(self.bigImage)
            make.right.equalTo(self.bigImage.snp_leftMargin).offset(-12)

         }
         self.headerLabel2.snp.makeConstraints { (make) in
             
             make.left.equalTo(12)
             make.top.equalTo(self.headerLabel1.snp_bottomMargin).offset(20)
             make.right.equalTo(self.bigImage.snp_leftMargin).offset(-12)

         }
        self.contentView.addSubview(self.line)

        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.5)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(0)
            
        }
         
         self.contentView.addGestureRecognizer(tap)
        
        self.contentView.addSubview(self.deleteButton)
        self.deleteButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)

        }
     }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content102{
            let m = aModel as! Content102
            
            if let a = m.name,let b = m.source{
                headerLabel1.text = a
                headerLabel2.text = b
            }else{
                headerLabel1.text = "数据数据数据数据"
                headerLabel2.text = "数据数据数据数据"
            }
            if let c = m.imageName{
                bigImage.image = UIImage.init(named: Image.fillImage(c))
            }else{
                bigImage.image = UIImage.init(named: Image.fillImage("che2"))
            }
            
            
           deleteButton.isHidden = m.isH
           deleteButton.v_click {
               
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
class Content102:VueData{
    
    var name:String?
    var source:String?
    var imageName:String?
    
    var isH = false
    convenience init(_ h:Bool){
        self.init()
        isH = h
    }
    convenience init(_ m: [String : String]?) {
        self.init()
        name = m?["title"]
        source = m?["source"]
        imageName = m?["imageUrl"]
        isH = true
                      
    }
    override func loadData(_ m: [String : String] ,_ aisH:Bool) {
        super.loadData(m, aisH)

        name = m["title"]
        source = m["source"]
        imageName = m["imageUrl"]
        isH = aisH

               
    }
    override func v_height() -> CGFloat {
        
        return 110
    }
}

