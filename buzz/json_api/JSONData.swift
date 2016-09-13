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

/* ----------------------------------------------- */
class BasicRespose : JSONData {
    var status: String?
    var message: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        status    <- map["status"]
        message   <- map["message"]
    }
}
/* ----------------------------------------------- */
class AuthResponse : BasicRespose {
    var clientID: String?
    var companyID: String?
    var companyLogo: String?
    var companyDescription: String?
    var companySignature: String?
    var companyPhoneNumber: String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        clientID            <- map["client_id"]
        companyID           <- map["company_id"]
        companyLogo         <- map["company_logo"]
        companyDescription  <- map["company_description"]
        companySignature    <- map["company_signature"]
        companyPhoneNumber  <- map["company_phone_number"]
    }
}
/* ----------------------------------------------- */
class MessageList : BasicRespose {
    var messages: [String]?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        messages            <- map["client_id"]

    }
}


