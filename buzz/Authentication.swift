//
//  Authentication.swift
//  buzz
//
//  Created by mekchi on 8/11/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import ObjectMapper

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



	