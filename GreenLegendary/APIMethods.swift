//
//  APIMethods.swift
//  GreenLegendary
//
//  Created by Emily on 15/8/5.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**
请求方式

- POST: POST
- GET:  GET
*/

//public enum Method {
//    case POST
//    case GET
//}

/**
响应状态

- success: 成功
- failure: 失败
*/
//public enum Status {
//    case success
//    case failure
//}

/**
*  网络请求响应
*/
//public class Response {
//    public var status: Status = .failure
//    public var object: JSON? = nil
//    public var error: NSError? = nil
//}

class APIMethods: NSObject {
    
    override init() {
        
    }
    
    class func register(params:[String: AnyObject]? = nil, success: (responseJSON: JSON?) ->Void, failure: (responseError: NSError?) ->Void){
        
        let url = "http://192.168.1.63:8080/football_legend/service/userRegist"
        
        Alamofire.request(.POST, url, parameters: params,encoding: ParameterEncoding.JSON)
            .responseJSON { (request, response, json, error) -> Void in
                if(error != nil) {
                    failure(responseError: error)
                }
                else {
                    println("Success: \(url)")
                    var json = JSON(json!)
                    success(responseJSON: json)
                }
        }
        
    }

    class func login(params:[String: AnyObject]? = nil, success: (responseJSON: JSON?) ->Void, failure: (responseError: NSError?) ->Void){
        
        let url = "http://192.168.1.193:8080/football_legend/service/sendInfo"
    
        Alamofire.request(.POST, url, parameters: params,encoding: ParameterEncoding.JSON)
            .responseJSON { (request, response, json, error) -> Void in
                if(error != nil) {
                    failure(responseError: error)
                }
                else {
                    println("Success: \(url)")
                    var json = JSON(json!)
                    success(responseJSON: json)
                }
        }
        
    }


//    class func login(username: NSString, password: NSString, success: (responseJSON: JSON?) ->Void, failure: (responseError: NSError?) ->Void){
//        
////        let url = "http://sportinghk.com:8081/irun/app/signin/signin"
//        let url = "http://192.168.1.63:8080/football_legend/service/sendInfo"
////        let url = "http://192.168.1.62:8080/control/checkemail"
//        
////        let params = [
////            "emailAddress": "123",
////        ]
//        
////        let params = [
////            "username": username,
////            "pwd": password,
////            "lang":"zh-hk"
////        ]
//        
//        let params = [
//            "phone": username,
//            "hmac": password,
//        ]
//        
//        Alamofire.request(.POST, url, parameters: params,encoding: ParameterEncoding.JSON)
//            .responseJSON { (request, response, json, error) -> Void in
//                if(error != nil) {
//                    failure(responseError: error)
//                }
//                else {
//                    println("Success: \(url)")
//                    var json = JSON(json!)
//                    success(responseJSON: json)
//                }
//
//        }
//    }
    
    
}
