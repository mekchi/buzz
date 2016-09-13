//
//  APIRequest.swift
//  test
//
//  Created by mekchi on 9/6/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import Foundation

import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class APIRequest {
    
    static func requestPOST<T: JSONData>(url: URLStringConvertible,
                            data: [String: String]!,
                            responseHandler: (T?) -> Void,
                            errorHandler: (NSError?) -> Void) {
        
        Alamofire.request(.POST, url, parameters: data).responseObject {
            (response: Response<T, NSError>) -> Void in
            if response.result.isSuccess {
                responseHandler(response.result.value)
            } else {
                errorHandler(response.result.error)
            }
        }
        
    }
    
//    func requestPOST(data: [String: String]!) -> BasicRespose? {
//        var result : BasicRespose?
//        
//        let url = "http://localhost/~mekchi/api/login.php"
//        
//        
//        
//        Alamofire.request(.POST, url, parameters: data).responseObject {
//            (response: Response<BasicRespose, NSError>) -> Void in
//            if response.result.isSuccess {
//                result = response.result.value
//                
//                debugPrint(result)
//                
//            } else {
//                // !log
//                debugPrint("Error!")
//            }
//        }
//        
//        return result
//    }
//    
//    
//    func test() {
//        
//        let url = "http://localhost/~mekchi/api/login.php"
//        
//        let values = [
//            "username": "aibol",
//            "password": "12345"
//        ]
//        
//        Alamofire.request(.POST, url, parameters: values).responseObject {
//            (response: Response<BasicRespose, NSError>) -> Void in
//            if response.result.isSuccess {
//                print(response.result.value)
//            }
//        }
//    }
}


        