//
//  APIRequest.swift
//  buzz
//
//  Created by mekchi on 8/10/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import Foundation

public class APIRequest {
    
    private var m_url:NSURL? = nil
    
    init (path:String) {
        m_url = NSURL(string : path)
    }
    
    
    func test() -> String {
        
        var result:String!
        
        if m_url != nil {
            let request = NSMutableURLRequest(URL : m_url!)
            
            request.HTTPMethod = "POST"
            
            var err : NSError?
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
            
            
            
        }
        
            
        return result;
        
        
    }
}