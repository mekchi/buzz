//: Playground - noun: a place where people can play

import UIKit

import ObjectMapper

@testable import buzzPlayground

let JSON: NSDictionary = ["username":"admin", "password":"123"]
let data = Mapper<AuthenticationDataIn>().map(JSON)

print(data?.toJSON())

