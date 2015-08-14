
//
//  BaseTabBarController.swift
//  GreenLegendary
//
//  Created by Emily on 15/7/28.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dicSelect = [UIColor.applicationLightGreenColor():NSForegroundColorAttributeName]
        let disSelect = [UIColor.applicationLightGreyColor():NSForegroundColorAttributeName]
        
        self.tabBar.backgroundColor = UIColor.applicationLightGreenColor()
        self.tabBar.translucent = false
        UITabBar.appearance().tintColor = UIColor.applicationGreenColor()
        UITabBarItem.appearance().setTitleTextAttributes(dicSelect, forState: UIControlState.Selected)
        UITabBarItem.appearance().setTitleTextAttributes(disSelect, forState: UIControlState.Normal)
    
        
        setupViewControllers()
        setupTabBar()
    }

    
    func setupTabBar(){
        
        let items = self.tabBar.items as! Array<UITabBarItem>
        
        items[0].title = "踢球"
        items[0].image = UIImage(named: "tab_default_40")
        items[0].selectedImage = UIImage(named: "tab_hover_40")
        
        items[1].title = "订场"
        items[1].image = UIImage(named: "tab_default_45")
        items[1].selectedImage = UIImage(named: "tab_hover_45")

        items[2].title = "发现"
        items[2].image = UIImage(named: "tab_default_43")
        items[2].selectedImage = UIImage(named: "tab_hover_43")

        items[3].title = "球队"
        items[3].image = UIImage(named: "tab_default_48")
        items[3].selectedImage = UIImage(named: "tab_hover_48")

        items[4].title = "我"
        items[4].image = UIImage(named: "tab_default_50")
        items[4].selectedImage = UIImage(named: "tab_hover_50")

        
    }
    
    func navgationControllers() -> [AnyObject]{
        let palyBoard = UIStoryboard(name: "Play", bundle: NSBundle.mainBundle())
        let fixBoard = UIStoryboard(name: "Fix", bundle: NSBundle.mainBundle())
        let findBoard = UIStoryboard(name: "Find", bundle: NSBundle.mainBundle())
        let teamBoard = UIStoryboard(name: "Team", bundle: NSBundle.mainBundle())
        let meBoard = UIStoryboard(name: "Me", bundle: NSBundle.mainBundle())
        
        let palyNavgation: AnyObject! = palyBoard.instantiateViewControllerWithIdentifier("nav1")
        let fixNavgation: AnyObject! = fixBoard.instantiateViewControllerWithIdentifier("nav2")
        let findNavgation: AnyObject! = findBoard.instantiateViewControllerWithIdentifier("nav3")
        let teamNavgation: AnyObject! = teamBoard.instantiateViewControllerWithIdentifier("nav4")
        let meNavgation: AnyObject! = meBoard.instantiateViewControllerWithIdentifier("nav5")
        
        return Array(arrayLiteral:palyNavgation,fixNavgation,findNavgation,teamNavgation,meNavgation)
    }

    func setupViewControllers(){
        self.setViewControllers(navgationControllers(), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
