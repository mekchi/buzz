//
//  buzzTests.swift
//  buzzTests
//
//  Created by mekchi on 8/9/16.
//  Copyright © 2016 mekchi. All rights reserved.
//

import XCTest
import Foundation

@testable import buzzPlayground

class buzzTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test() {
        let api: APIRequest = APIRequest(path: "http://localhost/~mekchi/api/login.php");
        
        api.test { (str) in
            print(str)
            }
//        api.test({(s: String) -> () in
//            print(s)
//        })

    }
}
