//
//  LoginViewController.swift
//  GreenLegendary
//
//  Created by Emily on 15/7/30.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController,WBHttpRequestDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
        
        // 注册
        let interParam = [
            "phone": "15302771570",
            "hmac": "85d795acaa2f908cde8eb86a0e69d61f",
            "checkCode": "4385",
            "password": "fcea920f7412b5da7be0cf42b8c93759"
        ]

        
        APIMethods.register( params: interParam, success: { (responseJSON) -> Void in
             println(responseJSON)
        }) { (responseError) -> Void in
             println(responseError)
        }
        
        // 普通用户登陆
        let loginParams = [
            "phone": "13624715513",
            "hmac": "85d795acaa2f908cde8eb86a0e69d61f",
        ]
        
        
//        APIMethods.login( params: loginParams, success: { (responseJSON) -> Void in
//            println(responseJSON)
//            }) { (responseError) -> Void in
//                println(responseError)
//        }

        
        
//        // Sina 登陆
//        // SSO 微博客户端授权认证
//        let request = WBAuthorizeRequest.request() as! WBAuthorizeRequest
//        request.redirectURI = SINA_REDIRECTURL
//        request.scope = "all"
//        WeiboSDK.sendRequest(request)
        
        
        
//        if WeiboSDK.isWeiboAppInstalled() {
//            
//            if WeiboSDK.isCanSSOInWeiboApp() {
//                
//            }
//            
//        }else
//        {
//            let downloadUrl = WeiboSDK.getWeiboAppInstallUrl
//        }
        
//        let sinweibo = WBHttpRequest()
//        WBHttpRequest
//        .requestForRenewAccessTokenWithRefreshToken:(NSString*)refreshToken
//        queue:(NSOperationQueue*)queue
//        withCompletionHandler:(WBRequestHandler)handler;

        

        
    }

    func request(request: WBHttpRequest!, didFailWithError error: NSError!) {
        
    }
    
    func request(request: WBHttpRequest!, didFinishLoadingWithResult result: String!) {
        
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
