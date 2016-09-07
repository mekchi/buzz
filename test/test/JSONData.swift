//
//  JSONData.swift
//  test
//
//  Created by mekchi on 9/6/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import Foundation

import ObjectMapper

protocol JSONData : Mappable {
    
}

struct BasicRespose : JSONData {
    var status : String?
    var message : String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        status    <- map["status"]
        message   <- map["message"]
    }
}


struct AuthenticationDataIn : Mappable {
    var username : String?
    var password : String?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        username    <- map["username"]
        password    <- map["password"]
    }
}

