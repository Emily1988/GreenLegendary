//
//  UIColor+Addtion.swift
//  GreenLegendary
//
//  Created by Emily on 15/7/30.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: Color
    class func applicationGreenColor() -> UIColor {   // 绿色导航栏
        return UIColor(red: 104/255.0, green: 199/255.0, blue: 91/255.0, alpha: 1)
    }
    

    class func applicationLightGreenColor() -> UIColor {   // 浅绿色
        return UIColor(red: 105/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
    }
    
    class func applicationLightGreyColor() -> UIColor {  // 浅灰色
        return UIColor(red: 187/255.0, green: 187/255.0, blue: 187/255.0, alpha: 1)
    }
    
    class func applicationDarkGreyColor() -> UIColor {   // 深灰色
        return UIColor(red: 115/255, green: 115/255, blue: 125/255, alpha: 1)
    }
    
    
}

