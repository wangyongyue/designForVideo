//
//  KnowledgeInstructions.swift
//  Demo
//
//  Created by apple on 2019/11/13.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift


class KnowledgeInstructions: Configuration {
    
    override init() {
        super.init()
        
        Vue.register(aClass: KnowledgeAttentionCellModel.classForCoder(), toClass: KnowledgeAttentionCell.classForCoder())
        Vue.register(aClass: KnowledgeRecomCellModel.classForCoder(), toClass: KnowledgeRecomCell.classForCoder())
        Vue.register(aClass: KnowledgeHotCellModel.classForCoder(), toClass: KnowledgeHotCell.classForCoder())
        Vue.register(aClass: KnowledgeMembersCellModel.classForCoder(), toClass: KnowledgeMembersCell.classForCoder())
        Vue.register(aClass: KnowledgeMessageCellModel.classForCoder(), toClass: KnowledgeMessageCell.classForCoder())
        Vue.register(aClass: KnowledgeProblemCellModel.classForCoder(), toClass: KnowledgeProblemCell.classForCoder())

        
        Vue.register(aClass: KnowledgeHomeNavCellModel.classForCoder(), toClass: KnowledgeHomeNavCell.classForCoder())
        Vue.register(aClass: KnowledgeMembersNavCellModel.classForCoder(), toClass: KnowledgeMembersNavCell.classForCoder())
        Vue.register(aClass: KnowledgeMessageNavCellModel.classForCoder(), toClass: KnowledgeMessageNavCell.classForCoder())
        Vue.register(aClass: KnowledgeMineNavCellModel.classForCoder(), toClass: KnowledgeMineNavCell.classForCoder())
        Vue.register(aClass: KnowledgeProblemNavCellModel.classForCoder(), toClass: KnowledgeProblemNavCell.classForCoder())

        
        Vue.register(aClass: KnowledgeM1CellModel.classForCoder(), toClass: KnowledgeM1Cell.classForCoder())
        Vue.register(aClass: KnowledgeM2CellModel.classForCoder(), toClass: KnowledgeM2Cell.classForCoder())
        Vue.register(aClass: KnowledgeM3CellModel.classForCoder(), toClass: KnowledgeM3Cell.classForCoder())
        Vue.register(aClass: KnowledgeM3CrossCellModel.classForCoder(), toClass: KnowledgeM3CrossCell.classForCoder())

        Vue.register(aClass: KnowledgeMineCellModel.classForCoder(), toClass: KnowledgeMineCell.classForCoder())
        Vue.register(aClass: KnowledgeMineCrossCellModel.classForCoder(), toClass: KnowledgeMineCrossCell.classForCoder())

        
        Vue.register(aClass: AddCellModel.classForCoder(), toClass: AddCell.classForCoder())
        Vue.register(aClass: NavMainCellModel.classForCoder(), toClass: NavMainCell.classForCoder())

        
        Vue.register(aClass: TabHMCellModel.classForCoder(), toClass: TabHMCell.classForCoder())
        Vue.register(aClass: TabHMMCellModel.classForCoder(), toClass: TabHMMCell.classForCoder())
        Vue.register(aClass: TabHHMMCellModel.classForCoder(), toClass: TabHHMMCell.classForCoder())
        Vue.register(aClass: TabHHSMMCellModel.classForCoder(), toClass: TabHHSMMCell.classForCoder())
        Vue.register(aClass: BriefCellModel.classForCoder(), toClass: BriefCell.classForCoder())

        Vue.register(aClass: HeadCellModel.classForCoder(), toClass: HeadCell.classForCoder())

        Vue.register(aClass: Content201CellModel.classForCoder(), toClass: Content201Cell.classForCoder())
        Vue.register(aClass: Content202CellModel.classForCoder(), toClass: Content202Cell.classForCoder())
        Vue.register(aClass: Content203CellModel.classForCoder(), toClass: Content203Cell.classForCoder())
        Vue.register(aClass: Content204CellModel.classForCoder(), toClass: Content204Cell.classForCoder())
        Vue.register(aClass: Content205CellModel.classForCoder(), toClass: Content205Cell.classForCoder())
        Vue.register(aClass: Content206CellModel.classForCoder(), toClass: Content206Cell.classForCoder())

        
        Vue.register(aClass: Content101CellModel.classForCoder(), toClass: Content101Cell.classForCoder())
        Vue.register(aClass: Content102CellModel.classForCoder(), toClass: Content102Cell.classForCoder())
        Vue.register(aClass: Content103CellModel.classForCoder(), toClass: Content103Cell.classForCoder())
        Vue.register(aClass: Content104CellModel.classForCoder(), toClass: Content104Cell.classForCoder())
        Vue.register(aClass: Content105CellModel.classForCoder(), toClass: Content105Cell.classForCoder())
        Vue.register(aClass: Content106CellModel.classForCoder(), toClass: Content106Cell.classForCoder())
        
        Vue.register(aClass: Content300CellModel.classForCoder(), toClass: Content300Cell.classForCoder())
        Vue.register(aClass: Content301CellModel.classForCoder(), toClass: Content301Cell.classForCoder())
        Vue.register(aClass: Content302CellModel.classForCoder(), toClass: Content302Cell.classForCoder())
        Vue.register(aClass: Content303CellModel.classForCoder(), toClass: Content303Cell.classForCoder())

        
        Vue.register(aClass: BannerCellModel.classForCoder(), toClass: BannerCell.classForCoder())
        Vue.register(aClass: BannerSubCellModel.classForCoder(), toClass: BannerSubCell.classForCoder())

               
        Vue.register(aClass: MineCellModel.classForCoder(), toClass: MineCell.classForCoder())
        Vue.register(aClass: MineTabCellModel.classForCoder(), toClass: MineTabCell.classForCoder())
        Vue.register(aClass: MineTabSubCellModel.classForCoder(), toClass: MineTabSubCell.classForCoder())
        Vue.register(aClass: MineSetupCellModel.classForCoder(), toClass: MineSetupCell.classForCoder())
        
        Vue.register(aClass: TitleCellModel.classForCoder(), toClass: TitleCell.classForCoder())

        
    }
    

    override func getTabBar() -> UIViewController{
        
        if let data = App.instance.tabBar{
            if data is TabHMCellModel{
               
               return createBar(images: ["konw_1","konw_1"], titles: ["tab1","tab2"])
            }else if data is TabHMMCellModel{
               
               return createBar(images: ["konw_1","konw_1","konw_1"], titles: ["tab1","tab2","tab3"])
            }else if data is TabHHMMCellModel{
               
               return createBar(images: ["konw_1","konw_1","konw_1","konw_1"], titles: ["tab1","tab2","tab3","tab4"])
            }else if data is TabHHSMMCellModel{
               
               return createBar(images: ["konw_1","konw_1","konw_1","konw_1","konw_1"], titles: ["tab1","tab2","tab3","tab4","tab5"])
            }
        }
        
         return UIViewController()
        }
    
    
    
    override func themeColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 132/255.0, blue: 225/255.0, alpha: 1.0)
    }
    
    override func backgroundColor() -> UIColor{
        return UIColor.white
    }
    override func tabBarBackgroundColor() -> UIColor{
        return UIColor.white
    }
    override func tabBarColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 132/255.0, blue: 225/255.0, alpha: 1.0)
    }
    override func navigtaionBackgroundColor() -> UIColor{
        return UIColor.white
    }
    override func navigtaionTextColor() -> UIColor{
        return UIColor.black
    }
    override func statusColor() -> UIColor{
        return UIColor.white
    }
    
    
}
extension KnowledgeInstructions{
    
    private func createBar(images:Array<String>,titles:Array<String>) -> UIViewController{
        let tab = BaseTabBarController()

        if App.instance.array.count > 0{
            for index in 0...images.count - 1 {
                if App.instance.array.count - 1 >= index{
                    
                    let d = Design()
                    d.r = App.instance.array[index]
                    tab.addChildVC(childVC: d.v_viewController(), childTitle: titles[index], image: UIImage.init(named: images[index]), selectedImage:UIImage.init(named: images[index]))
                    
                }else{
                    
                    let d = Design()
                    d.r.title =  titles[index]
                    tab.addChildVC(childVC: d.v_viewController(), childTitle: titles[index], image: UIImage.init(named: images[index]), selectedImage:UIImage.init(named: images[index]))
                    
                }
              
            }
            
            App.instance.removeAll()

        }else{
            for index in 0...images.count - 1 {
                let d = Design()
                d.r.title =  titles[index]
                tab.addChildVC(childVC: d.v_viewController(), childTitle: titles[index], image: UIImage.init(named: images[index]), selectedImage:UIImage.init(named: images[index]))
                
            }
            
        }
        return tab
    }
    
   
}
