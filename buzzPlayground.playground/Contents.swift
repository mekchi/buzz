//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import ObjectMapper
import Alamofire

@testable import buzzPlayground

    
let parameters = [
    "username": "aibol",
    "password": "12345"
    ]

Alamofire.request(.POST, "http://localhost/~mekchi/api/login.php", parameters: parameters)
    .responseJSON { response in
        print(response.request)  // original URL request
        print(response.response) // URL response
        print(response.data)     // server data
        print(response.result)   // result of response serialization

        if let JSON = response.result.value {
            print("JSON: \(JSON)")
        }
}
