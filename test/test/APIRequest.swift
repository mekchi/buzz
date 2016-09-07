//
//  APIRequest.swift
//  test
//
//  Created by mekchi on 9/6/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


func test() {
    
    let url = "http://localhost/~mekchi/api/login.php"
    
    let values = [
        "username": "aibol",
        "password": "12345"
    ]
    
    
    Alamofire.request(.POST, url, parameters: values).responseObject {
         (response: Response<BasicRespose, NSError>) -> Void in
        if response.result.isSuccess {
            print(response.result.value)
        }
    }
}
        