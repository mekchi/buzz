//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import ObjectMapper

@testable import buzzPlayground

XCPSetExecutionShouldContinueIndefinitely(true)

let url = NSURL(string: "http://localhost/~mekchi/api/login.php")
let request = NSMutableURLRequest(URL : url!)
let config = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: config)

request.HTTPMethod = "POST"

let dictionary: NSDictionary = ["tag":"login", "username":"aibol", "password":"12345"]
let json = Mapper<AuthenticationDataIn>().map(dictionary)

request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.addValue("application/json", forHTTPHeaderField: "Accept")

//request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(dictionary, options: .PrettyPrinted)
request.HTTPBody = json?.toJSONString()?.dataUsingEncoding(NSUTF8StringEncoding)


//NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
//{
//    (response, data, error) in
//    print(response)
//    print(response?.debugDescription)
//
//}

let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {(data: NSData?,
    response: NSURLResponse?,
    error: NSError?) in
    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
    print("responseString = \(responseString)")
    print(response)
    print(error)
}).resume()

