//
//  AsteroidsTests.swift
//  SwiftAA
//
//  Created by Cédric Foellmi on 2017-09-17.
//  Copyright © 2017 onekiloparsec. All rights reserved.
//

import XCTest
@testable import SwiftAA

class AsteroidsTests: XCTestCase {
    
    func testDiameters() {
        
        // See AA p.392
        let albedoCeres = 0.10
        let albedoPallas = 0.14
        let albedoJuno = 0.22
        let albedoVesta = 0.38
        
        // See AA p.231
        let absMagCeres = Magnitude(3.34)
        let absMagPallas = Magnitude(4.13)
        let absMagJuno = Magnitude(5.33)
        let absMagVesta = Magnitude(3.20)
        
        // Wikipedia says Ceres is about 950 km in diameter. The calculation here are only approximate "diameters"
        AssertEqual(asteroidDiameter(magnitude: absMagCeres, albedo: albedoCeres), Kilometer(950.0), accuracy: Kilometer(100))
        
        // Wikipedia says Ceres is about 950 km in diameter. The calculation here are only approximate "diameters"
        AssertEqual(asteroidDiameter(magnitude: absMagPallas, albedo: albedoPallas), Kilometer(545), accuracy: Kilometer(30))
        
        // Wikipedia says Ceres is about 234 km in diameter. The calculation here are only approximate "diameters"
        AssertEqual(asteroidDiameter(magnitude: absMagJuno, albedo: albedoJuno), Kilometer(234), accuracy: Kilometer(10))
        
        // Wikipedia says Ceres is about 530 km in diameter. The calculation here are only approximate "diameters"
        AssertEqual(asteroidDiameter(magnitude: absMagVesta, albedo: albedoVesta), Kilometer(530), accuracy: Kilometer(50))
    }
    
}
