//
//  BaseNavigationController.swift
//  GreenLegendary
//
//  Created by Emily on 15/7/28.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

import UIKit


class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dicAttribute = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationBar.translucent = false
        self.navigationBar.barTintColor = UIColor.applicationGreenColor()
//        self.navigationBar.titleTextAttributes = dicAttribute
        UINavigationBar.appearance().titleTextAttributes = dicAttribute
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count != 0 {
            viewController.hidesBottomBarWhenPushed = true;
        }
        super.pushViewController(viewController, animated: animated)
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
