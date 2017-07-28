//
//  OpenLocationCodeTests.swift
//  OpenLocationCodeTests
//
//  Created by Eli Selkin on 7/25/17.
//  Copyright © 2017 Eli Selkin. All rights reserved.
//

import XCTest
@testable import OpenLocationCode

class OpenLocationCodeTests: XCTestCase {
    let epsilon = 1E-6
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithCode() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let x:OpenLocationCode? = try? OpenLocationCode("85634RQ4+X37")
        assert(x != nil)
    }
    
    func testInitWithLatLng() {
        let x: OpenLocationCode? = try? OpenLocationCode(latitude: 34.139912, longitude: -118.194828, codeLength: 11)
        assert(x != nil)
        assert(x?.getCode() == "85634RQ4+X37")
        let y: OpenLocationCode? = try? OpenLocationCode(latitude: 34.139912, longitude: -118.194838, codeLength: 11)
        assert(y != nil)
        // should only differ in the last two characters
        let filtered = zip(x!.getCode().characters, y!.getCode().characters).filter{$0 != $1}
        assert(filtered.count <= 2)
    }
    
    func testDecode() {
        let codeArea: CodeArea = try! OpenLocationCode.decode(code: "85634RQ4+X37")
        let test = codeArea.LatLng()
        assert(fabs(fabs(test.latitude) - fabs(34.139912)) < epsilon)
        assert(fabs(fabs(test.longitude) - fabs(-118.194828)) < epsilon)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}