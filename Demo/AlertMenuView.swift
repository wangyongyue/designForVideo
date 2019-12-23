//
//  AlertMenuView.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift

class AlertMenuView: UIView ,UICollectionViewDelegate{

    var m:Vue?
    var number:CGFloat = 0
    private var tab:CCollection?
    private var table:CCollection?
    private var line = UIView()
    private var lineView = UIView()

    private var contentLayout:UICollectionViewFlowLayout?

    convenience init(_ m:Vue,_ number:CGFloat) {
        self.init()
        self.m = m
        self.number = number
        
       
        self.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        let window = UIApplication.shared.keyWindow
        self.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(self)
        
        
        let tabLayout = UICollectionViewFlowLayout()
        tabLayout.itemSize = CGSize.init(width: WIDTH/number, height: 50)
        tabLayout.scrollDirection = .horizontal
        tabLayout.minimumLineSpacing = 0
        tabLayout.minimumInteritemSpacing = 0
        let tab = CCollection.init(frame: CGRect.zero, collectionViewLayout: tabLayout)
        self.addSubview(tab)
        tab.backgroundColor = Configuration.instructions.backgroundColor()
        tab.snp.makeConstraints { (make) in
            
            make.top.equalTo(300)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(50)
            
        }
        
        tab.v_array(vId: TABID, vue: m)
        tab.v_index(vId: TABINDEXID, vue: m)
        tab.v_didSelect { (index) in
            
            self.table?.setContentOffset(CGPoint.init(x: WIDTH * CGFloat(index), y: 0), animated: true)
            UIView.animate(withDuration: 0.3) {
                
                var frame = self.line.frame
                frame.origin.x = WIDTH/self.number * CGFloat(index)
                self.line.frame = frame
            }
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: WIDTH, height: 60)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.addSubview(table)
        table.isPagingEnabled = true
        table.backgroundColor = Configuration.instructions.backgroundColor()
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(350)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.v_array(vId: ARRAYID, vue: m)
        table.delegate = self
        
        
        self.addSubview(self.line)
        self.line.backgroundColor = UIColor.white
        self.line.frame = CGRect.init(x: 0, y: 350 - 2, width: WIDTH/number, height: 2)
        
        self.line.addSubview(self.lineView)
        self.lineView.backgroundColor = Configuration.instructions.themeColor()
        self.lineView.frame = CGRect.init(x: (WIDTH/number - 60)/2 , y: 0, width: 60, height: 2)
        
        
        
        self.tab = tab
        self.table = table
        self.contentLayout = layout
        
        m.v_if(vId: SUPERVIEWREMOVE) { (isF) in
            
            if isF{
                
                self.removeFromSuperview()

            }
        }
        
        
        m.v_start()

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentLayout?.itemSize = CGSize.init(width: WIDTH, height: self.frame.height - 350)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / WIDTH
        UIView.animate(withDuration: 0.3) {
            
            var frame = self.line.frame
            frame.origin.x = WIDTH/self.number * index
            self.line.frame = frame
        }
        
        self.m?.v_index(vId: TABINDEXID, index: Int(index))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }

}
