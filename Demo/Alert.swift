//
//  Alert.swift
//  Demo
//
//  Created by wangyongyue on 2019/8/22.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class Alert: UIView {

    static func show(str:String){
        
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        
        let window = UIApplication.shared.keyWindow
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.frame = CGRect.init(x: 50, y: v.frame.height/2 - 80, width: v.frame.width - 100, height: 50)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        v.addSubview(label)
        
        label.text = str
        
    
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {

            v.removeFromSuperview()
        }
        
        
    }
    
    static func loading(){
           
        let view = AlertView()
        view.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        let window = UIApplication.shared.keyWindow
        view.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(view)
        let spinner = UIActivityIndicatorView.init(style: .whiteLarge)
        spinner.color = UIColor.white;
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
           
    }
    static func dissmiss(){
        let window = UIApplication.shared.keyWindow
        let arr = window?.subviews
        if let a = arr{
            for value in a{
                if value is AlertView{
                    value.removeFromSuperview()
                }
            }
           
        }
        
    }
    static func editorContent(_ aplaceholder:String,_ block:@escaping (String) -> ()){
        
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        
        let window = UIApplication.shared.keyWindow
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        bgView.frame = CGRect.init(x: 50, y: 200, width: v.frame.width - 100, height: 110)
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        v.addSubview(bgView)
        
        let textField = UITextField()
        textField.textColor = UIColor.black
        textField.frame = CGRect.init(x: 10, y: 10, width: v.frame.width - 120, height: 50)
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.placeholder = aplaceholder 
        textField.backgroundColor = UIColor.clear
        textField.layer.borderColor = UIColor.black.cgColor
        bgView.addSubview(textField)
        
        let leftButton = UIButton()
        leftButton.setTitle("取消", for: .normal)
        leftButton.setTitleColor(Configuration.instructions.themeColor(), for: .normal)
        leftButton.frame = CGRect.init(x: 10, y: 60, width: 60, height: 50)
        bgView.addSubview(leftButton)
        
        let rightButton = UIButton()
        rightButton.setTitle("确定", for: .normal)
        rightButton.setTitleColor(Configuration.instructions.themeColor(), for: .normal)
        rightButton.frame = CGRect.init(x: bgView.frame.width - 60, y: 60, width: 60, height: 50)
        bgView.addSubview(rightButton)
        
        rightButton.v_click {
            if let str = textField.text{
                if str.count <= 0{
                    return Alert.show(str: "内容不能为空")
                }
                block(str)
            }else{
                return Alert.show(str: "内容不能为空")

            }
            v.removeFromSuperview()

        }
        leftButton.v_click {
            v.removeFromSuperview()
        }
    }
    
    static func defaultImageStyle(_ block:@escaping () -> ()){
        
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        
        let window = UIApplication.shared.keyWindow
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        bgView.frame = CGRect.init(x: 50, y: 200, width: v.frame.width - 100, height: 110)
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        v.addSubview(bgView)
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.frame = CGRect.init(x: 10, y: 10, width: v.frame.width - 120, height: 50)
        label.textAlignment = .center
        label.text = "是否选择彩色图片的样式进行操作"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.clear
        label.layer.borderColor = UIColor.black.cgColor
        bgView.addSubview(label)
        
        let leftButton = UIButton()
        leftButton.setTitle("取消", for: .normal)
        leftButton.setTitleColor(Configuration.instructions.themeColor(), for: .normal)
        leftButton.frame = CGRect.init(x: 10, y: 60, width: 60, height: 50)
        bgView.addSubview(leftButton)
        
        let rightButton = UIButton()
        rightButton.setTitle("确定", for: .normal)
        rightButton.setTitleColor(Configuration.instructions.themeColor(), for: .normal)
        rightButton.frame = CGRect.init(x: bgView.frame.width - 60, y: 60, width: 60, height: 50)
        bgView.addSubview(rightButton)
        
        rightButton.v_click {
            Configuration.instructions.imageDefault = true
            block()
            v.removeFromSuperview()

        }
        leftButton.v_click {
            Configuration.instructions.imageDefault = false
            block()
            v.removeFromSuperview()
        }
    }
    static func touch(_ point:CGPoint?){
        let window = UIApplication.shared.windows.first
        if let arr  = window?.subviews{
            for value in arr{
                if value.tag == 1000{
                    return
                }
            }
        }

        let v = UIView()
        
        if Configuration.instructions.imageDefault{
            v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.6)

        }else{
            
            v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.6)

        }
        v.tag = 1000
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        

        v.frame = CGRect.init(x: 100, y: 100, width: 50, height: 50)
        if let p = point{
            v.center = p
        }
        v.layer.cornerRadius = 25
        v.layer.masksToBounds = true
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            v.removeFromSuperview()
        }

        
        
    }
    static func touchMove(_ point:CGPoint?){
        let window = UIApplication.shared.windows.first
        var isN = false
        if let arr  = window?.subviews{
            for value in arr{
                if value.tag == 10000{

                     isN = true
                     if let a = window?.viewWithTag(10000), let p = point{
                         a.center = p
                     }

                }else{
                    
                    
                    
                    
                }
            
            }
        }

        let v = UIView()
        
        if Configuration.instructions.imageDefault{
            v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.6)

        }else{
            
            v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.6)

        }
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        

        v.frame = CGRect.init(x: 100, y: 100, width: 50, height: 50)
        if let p = point{
            v.center = p
        }
        v.layer.cornerRadius = 25
        v.layer.masksToBounds = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            v.removeFromSuperview()
        }
        
        if isN == false{
            
            let next = UIView()
            if Configuration.instructions.imageDefault{
                   next.backgroundColor = UIColor.init(white: 1.0, alpha: 0.9)

               }else{
                   
                   next.backgroundColor = UIColor.init(white: 0.6, alpha: 0.6)

               }
               next.tag = 10000
               next.frame = window?.bounds ?? CGRect.zero
               window?.addSubview(next)
               

               next.frame = CGRect.init(x: 100, y: 100, width: 50, height: 50)
               if let p = point{
                   next.center = p
               }
               next.layer.cornerRadius = 25
               next.layer.masksToBounds = true
            
              
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                   next.removeFromSuperview()
               }
                   
                   
        }

        
        
    }
    
    
    
    

}
