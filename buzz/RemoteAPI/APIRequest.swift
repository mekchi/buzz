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
            AuthenticationDataIn data = AuthenticationDataIn(username:"admin", password:"password")
            AuthenticationDataIn.toJSON(data);
            
            
            request.HTTPBody = 
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
            {
                data, response, error in
                
                if error != nil
                {
                    println("error=\(error)")
                    return
                }
                
                // You can print out response object
                println("response = \(response)")
                
                // Print out response body
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("responseString = \(responseString)")
                
                //Let's convert response sent from a server side script to a NSDictionary object:
                
                var err: NSError?
                var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
                
                if let parseJSON = myJSON {
                    // Now we can access value of First Name by its key
                    var firstNameValue = parseJSON["firstName"] as? String
                    println("firstNameValue: \(firstNameValue)")
                }
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
            }
            
            task.resume()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        }
            
            
            
        }
        
            
        return result;
        
        
    }

}