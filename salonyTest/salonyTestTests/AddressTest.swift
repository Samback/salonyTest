//
//  AddressTest.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import XCTest

class AddressTest: XCTestCase {
    
    var jsonStringExample = "{\"address\":{\"area\":{\"id\":1,\"name\":\"Abdulla Al-Salem\"},\"lat\":\"29.35398469623976\",\"lng\":\"47.98739477992058\",\"address_params\":{\"block\":\"Block 2\",\"province\":\"Al Asimah Governate\",\"street\":\"28 Street\",\"avenue\":null,\"building\":null},\"preview\":\"Abdulla Al-Salem, Block 2, 28 Street\"}}"
    
    var dictionary: JSONDictionary = [:]
    override func setUp() {
        super.setUp()
        
        if let dict = jsonStringExample.convertToJSONDictionary()?["address"] as? JSONDictionary {
            dictionary = dict
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddress() {
        let address = Address(json: dictionary)
        
        XCTAssertNotNil(address, "Address struct is nil")
        XCTAssertNotNil(address?.area, "Address area struct is nil")
        XCTAssertNotNil(address?.parameters, "Address parameters struct is nil")
        XCTAssertNotNil(address?.preview, "Address preview wrong parsing")
        XCTAssertNil(address?.specialInstrcutions, "Address specialInstrcutions wrong parsing")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
