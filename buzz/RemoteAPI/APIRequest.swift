//
//  APIRequest.swift
//  buzz
//
//  Created by mekchi on 8/10/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import Alamofire
import ObjectMapper

import Foundation

public class APIRequest {
    
    private var m_url:NSURL? = nil
    
    init (path:String) {
        m_url = NSURL(string : path)
    }
    
    
    func test(completionHandler: (String?) -> ()) ->() {
        
        let url = NSURL(string: "http://localhost/~mekchi/api/login.php")!
        var request = NSMutableURLRequest(URL : url)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let values = [
            "username": "aibol",
            "password": "12345"
        ]
        
        //let dictionary: NSDictionary = ["tag":"login", "username":"aibol", "password":"12345"]
        //let json = Mapper<AuthenticationDataIn>().map(dictionary)
        
        //request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(dictionary, options: .PrettyPrinted)
        //request.HTTPBody = json?.toJSONString()?.dataUsingEncoding(NSUTF8StringEncoding)
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(values, options: [])
        
        Alamofire.request(request)
            .responseJSON { response in
                // do whatever you want here
                switch response.result {
                case .Failure(let error):
                    completionHandler(error.localizedDescription)
                    
                    // if web service reports error, sometimes the body of the response
                    // includes description of the nature of the problem, e.g.
                    
                    if let data = response.data, let responseString = String(data: data, encoding: NSUTF8StringEncoding) {
                        completionHandler(responseString)
                    }
                case .Success(let responseObject):
                    completionHandler(responseObject.absoluteString)
                }
                
        }
        
        
        
        
        
        /*var result:String! = "1"
        
        if m_url != nil {
            
            let url = NSURL(string: "http://127.0.0.1/~mekchi/api/login.php")
            let request = NSMutableURLRequest(URL : url!)
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            
            request.HTTPMethod = "POST"
            
            let dictionary: NSDictionary = ["username":"aibol", "password":"12345"]
            let json = Mapper<AuthenticationDataIn>().map(dictionary)
            
            request.HTTPBody = json?.toJSONString()?.dataUsingEncoding(NSUTF8StringEncoding)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            result = "2"
            
//            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
//            {
//                (response, data, error) in
//                print(response)
//                result = response?.debugDescription
//                
//            }
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
                data, response, error in
//            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            
                if error != nil
                {
                    result = "error=\(error)"
                    return
                }
                
                // You can print out response object
                result = "response = \(response)"
                
                // Print out response body
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                result = "responseString = \(responseString)"
                
                finished(result)
                
            }
            
            task.resume()
           // UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        }*/
    }

}