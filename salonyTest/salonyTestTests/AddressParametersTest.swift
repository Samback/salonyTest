//
//  AddressParametersTest.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import XCTest

class AddressParametersTest: XCTestCase {
    
    var jsonStringExample = "{\"block\":\"Block 2\",\"province\":\"Al Asimah Governate\",\"street\":\"28 Street\",\"avenue\":null,\"building\":null}"
    
    var dictionary: JSONDictionary = [:]
    
    override func setUp() {
        super.setUp()
        
        if let dict = jsonStringExample.convertToJSONDictionary() {
            dictionary = dict
        }

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddressParameters() {
        let addressParameters = AddressParameters(json: dictionary)
        
        XCTAssertNotNil(addressParameters, "Address parameters struct is nil")
        XCTAssertNotNil(addressParameters.block, "Address parameters block wrong parsing")
        XCTAssertNotNil(addressParameters.province, "Address parameters province wrong parsing")
        XCTAssertNotNil(addressParameters.street, "Address parameters province wrong parsing")
        XCTAssertNil(addressParameters.avenue, "Address parameters avenue wrong parsing")
        XCTAssertNil(addressParameters.building, "Address parameters building wrong parsing")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
