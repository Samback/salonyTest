//
//  AreaTest.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import XCTest

class AreaTest: XCTestCase {
    
    var jsonStringExample =  "{\"area\":{\"id\":1,\"name\":\"Abdulla Al-Salem\"}}"
    var jsonStringExample1 = "{\"area\":{\"id\":1,\"name\":null}}"
    var jsonStringExample2 = "{\"area\":{\"id\":null,\"name\":\"Abdulla Al-Salem\"}}"
    
    var dictionary: JSONDictionary = [:]
    var dictionary1: JSONDictionary = [:]
    var dictionary2: JSONDictionary = [:]
    
    override func setUp() {
        super.setUp()
        
        if let dict = jsonStringExample.convertToJSONDictionary()?["area"] as? JSONDictionary {
            dictionary = dict
        }
        
        if let dict = jsonStringExample1.convertToJSONDictionary()?["area"] as? JSONDictionary {
            dictionary1 = dict
        }
        
        if let dict = jsonStringExample2.convertToJSONDictionary()?["area"] as? JSONDictionary {
            dictionary2 = dict
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArea() {
        let area = Area(json: dictionary)
        
        XCTAssertNotNil(area, "Address struct is nil")
        XCTAssertNotNil(area.name, "Address area name wrong parsing")
        XCTAssertNotNil(area.id, "Address area id wrong parsing")
    }
    
    func testAreaNilName() {
        let area = Area(json: dictionary1)
        
        XCTAssertNotNil(area, "Address struct is nil")
        XCTAssertNil(area.name, "Address area name wrong parsing")
        XCTAssertNotNil(area.id, "Address area id wrong parsing")
    }
    
    func testAreaNilId() {
        let area = Area(json: dictionary2)
        
        XCTAssertNotNil(area, "Address struct is nil")
        XCTAssertNotNil(area.name, "Address area name wrong parsing")
        XCTAssertNil(area.id, "Address area id wrong parsing")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
