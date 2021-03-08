//
//  Climber.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import Foundation
import CoreLocation

struct Climber {
    var mountain: (name: String, nativeNames: [String], elevation: Double, prominence: Double, isolation: Double, coordinates: CLLocationCoordinate2D, location: String, routes: [String : (name: String, stops: [(name: String, elevation: Double)])])
    
    init(mountain m: (name: String, nativeNames: [String], elevation: Double, prominence: Double, isolation: Double, coordinates: CLLocationCoordinate2D, location: String, routes: [String : (name: String, stops: [(name: String, elevation: Double)])])) {
        mountain = m
    }
    
    var flightsClimbed: UInt = 0
}
