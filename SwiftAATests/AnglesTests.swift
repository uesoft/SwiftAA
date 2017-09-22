//
//  AnglesTests.swift
//  SwiftAA
//
//  Created by Cédric Foellmi on 22/02/2017.
//  Copyright © 2017 onekiloparsec. All rights reserved.
//

import XCTest
@testable import SwiftAA

class AnglesTests: XCTestCase {
    func testDegreeMinusSignConstructor() {
        XCTAssertEqual(Degree(.minus, 1, 7, 30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, -1, 7, 30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, 1, -7, 30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, 1, 7, -30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, -1, -7, 30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, 1, -7, -30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, -1, 7, -30.0).value, -1.125)
        XCTAssertEqual(Degree(.minus, -1, -7, -30.0).value, -1.125)
    }
    
    func testDegreePlusSignConstructor() {
        XCTAssertEqual(Degree(.plus, 1, 7, 30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, -1, 7, 30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, 1, -7, 30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, 1, 7, -30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, -1, -7, 30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, -1, -7, -30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, -1, 7, -30.0).value, 1.125)
        XCTAssertEqual(Degree(.plus, 1, -7, -30.0).value, 1.125)
    }
    
    func testDegreeMinusZeroSignConstructor() {
        XCTAssertEqual(Degree(.minus, 0, 7, 30.0).value, -0.125)
        XCTAssertEqual(Degree(.minus, 0, -7, 30.0).value, -0.125)
        XCTAssertEqual(Degree(.minus, 0, 7, -30.0).value, -0.125)
        XCTAssertEqual(Degree(.minus, 0, -7, -30.0).value, -0.125)
        XCTAssertEqual(Degree(.minus, 0, 0, 90.0).value, -0.025)
        XCTAssertEqual(Degree(.minus, 0, 0, -90.0).value, -0.025)
    }
    
    func testDegreePlusZeroSignConstructor() {
        XCTAssertEqual(Degree(.plus, 0, 7, 30.0).value, 0.125)
        XCTAssertEqual(Degree(.plus, 0, -7, 30.0).value, 0.125)
        XCTAssertEqual(Degree(.plus, 0, 7, -30.0).value, 0.125)
        XCTAssertEqual(Degree(.plus, 0, -7, -30.0).value, 0.125)
        XCTAssertEqual(Degree(.plus, 0, 0, 90.0).value, 0.025)
        XCTAssertEqual(Degree(.plus, 0, 0, -90.0).value, 0.025)
    }
    
    func testDegreeSexagesimalTransform() {
        let dplus = Degree(1.125)
        let dplussexagesimal: SexagesimalNotation = (.plus, 1, 7, 30.0)
        XCTAssertTrue(dplus.sexagesimal == dplussexagesimal)
        
        let dminus = Degree(-1.125)
        let dminussexagesimal: SexagesimalNotation = (.minus, 1, 7, 30.0)
        XCTAssertTrue(dminus.sexagesimal == dminussexagesimal)
    }
    
    func testDegreeConversions() {
        let d1 = 3.1415
        let d2 = -2.718
        
        XCTAssertEqual(Degree(d1).inArcMinutes.value, d1*60.0)
        XCTAssertEqual(Degree(d2).inArcMinutes.value, d2*60.0)
        
        XCTAssertEqual(Degree(d1).inArcSeconds.value, d1*3600.0)
        XCTAssertEqual(Degree(d2).inArcSeconds.value, d2*3600.0)
    }
    
    func testArcMinuteConversions() {
        let d1 = 3.1415
        let d2 = -2.718
        
        XCTAssertEqual(ArcMinute(d1).inDegrees.value, d1/60.0)
        XCTAssertEqual(ArcMinute(d2).inDegrees.value, d2/60.0)
        
        XCTAssertEqual(ArcMinute(d1).inArcSeconds.value, d1*60.0)
        XCTAssertEqual(ArcMinute(d2).inArcSeconds.value, d2*60.0)
    }

    func testArcSecondConversions() {
        let d1 = 3.1415
        let d2 = -2.718
        
        XCTAssertEqual(ArcSecond(d1).inDegrees.value, d1/3600.0)
        XCTAssertEqual(ArcSecond(d2).inDegrees.value, d2/3600.0)
        
        XCTAssertEqual(ArcSecond(d1).inArcMinutes.value, d1/60.0)
        XCTAssertEqual(ArcSecond(d2).inArcMinutes.value, d2/60.0)
    }

    func testArcSecondAsParallax() {
        XCTAssertEqual(ArcSecond(1).distance().value, 1.0)
        XCTAssertEqual(ArcSecond(10).distance().value, 0.1)
    }
}
