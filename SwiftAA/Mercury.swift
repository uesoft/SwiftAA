//
//  Mercury.swift
//  SwiftAA
//
//  Created by Cédric Foellmi on 19/06/16.
//  Copyright © 2016 onekiloparsec. All rights reserved.
//

import Foundation

public struct Mercury: Planet {
    public var julianDay: JulianDay
    public var eclipticObject: KPCEclipticObject { return .Mercury }
    public var planet: KPCPlanetaryObject { return .MERCURY }

    public init(julianDay: JulianDay) {
        self.julianDay = julianDay
    }
    
    public var color: Color {
        get { return Color(red: 0.569, green:0.545, blue:0.506, alpha: 1.0) }
    }
}