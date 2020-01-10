//
//  Configuration.swift
//  Demo
//
//  Created by apple on 2019/7/5.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

let TOP:CGFloat = 64
let BOTTOM:CGFloat = 40
let WIDTH:CGFloat = UIScreen.main.bounds.width
let HEIGHT:CGFloat = UIScreen.main.bounds.height

//主体颜色
let  themeColor = UIColor.init(red: 9/255.0, green: 169/255.0, blue: 159/255.0, alpha: 1.0)
let  bgColor = UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)

class Configuration{
    
    var imageDefault = true //false true //为true显示默认图片

    static let instructions = KnowledgeInstructions()
    
    func getTabBar() -> UIViewController{
        let tab = BaseTabBarController()
        tab.addChildVC(childVC: Home().v_viewController(), childTitle: "主页", image: Image.home(), selectedImage: Image.home_sel())
        return tab
    }
    func getMainTabBar() -> UIViewController{
        let tab = BaseTabBarController()
        tab.addChildVC(childVC: Home().v_viewController(), childTitle: "主页", image: Image.home(), selectedImage: Image.home_sel())
        return tab
    }
    func themeColor() -> UIColor{
        return UIColor.init(red: 9/255.0, green: 169/255.0, blue: 159/255.0, alpha: 1.0)
    }
    func backgroundColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func tabBarBackgroundColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func tabBarColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func navigtaionBackgroundColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func statusColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func navigtaionTextColor() -> UIColor{
          return UIColor.black
    }
    
}
extension UIViewController{
    
   
    static func toHome(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let tab = Configuration.instructions.getTabBar()
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
        
//        let tab = BaseNavigationController.init(rootViewController: Menu().v_viewController())

    
    }
    
    static func toLogin(){
            let app = UIApplication.shared.delegate as! AppDelegate
            let tab = BaseNavigationController.init(rootViewController: Login().v_viewController())
            app.window?.rootViewController = tab;
            app.window?.makeKeyAndVisible();
            

        
        }
    static func toMain(){
        App.instance.cache()
        App.instance.removeAll()
        let app = UIApplication.shared.delegate as! AppDelegate
        let tab = BaseNavigationController.init(rootViewController: Main().v_viewController())
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
               
    }
    
    static func toProject(){
            let app = UIApplication.shared.delegate as! AppDelegate
        

            let tab = Configuration.instructions.getMainTabBar()
            app.window?.rootViewController = tab;
            app.window?.makeKeyAndVisible();
            
        
        }
    static func toPage(){
        let app = UIApplication.shared.delegate as! AppDelegate

        let tab = BaseNavigationController.init(rootViewController: SPage().v_viewController())
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
        
    
    }
    static func toAutoPage(){
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let so = DataSource()
        so.sourceStr = "Soure1"
        let m = AutoPage()
        m.source = so
      
        let tab = BaseNavigationController.init(rootViewController: m.v_viewController())
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
        
    
    }
    static func toCodePage(){
        let app = UIApplication.shared.delegate as! AppDelegate
       
        let m = Page()
      
        let tab = BaseNavigationController.init(rootViewController: m.v_viewController())
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
        
    
    }
}
extension UIApplication {

    func changeMethod(_ object: AnyClass) -> () {
        
        let originalSelector = #selector(sendEvent(_:))
        let swizzledSelector = #selector(MysendEvent(_:))
        
        let originalMethod = class_getInstanceMethod(object, originalSelector)
        let swizzledMethod = class_getInstanceMethod(object, swizzledSelector)
        
        let didAddMethod: Bool = class_addMethod(object, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        if didAddMethod {
            class_replaceMethod(object, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
    
    @objc func MysendEvent(_ event: UIEvent){
        
       if let touchs = event.allTouches{
            
            if let touch = touchs.first,let a = touch.gestureRecognizers?.first?.classForCoder{
                let point = touch.location(in: UIApplication.shared.windows.first)

                if NSStringFromClass(a) == "_UISystemGestureGateGestureRecognizer"{
                       Alert.touch(point)
                }else{
                    Alert.touchMove(point)
                }
               
            }
            
            
        }
        //App的点击事件
        print("The user is active")
        MysendEvent(event)
        
    }
}
