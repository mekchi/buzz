//
//  AppDelegate.swift
//  test
//
//  Created by mekchi on 9/9/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
//        let url = "http://localhost/~mekchi/api/login.php"
        let url = "http://localhost/~mekchi/api/get_messages.php"
        
//        let values = [
//            "username": "aibol",
//            "password": "12345"
//        ]
        
        let values = [
            "client_id": "104",
            "password": "12345"
        ]
        
        func responseHandler(response: MessageListResponse?) {
            print(response?.message)
            print(response?.toJSONString())
        }
        
        func errorHandler(error: NSError?) {
            print(error)
        }
        
        APIRequest.requestPOST(url, data: values, responseHandler: responseHandler, errorHandler: errorHandler)
     
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

