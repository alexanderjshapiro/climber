//
//  Climber.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import Foundation
import CoreLocation

struct Climber {
    var newClimberStep: UInt = 1
    
    var mountain: (name: String?, nativeNames: [String]?, elevation: Double?, prominence: Double?, isolation: Double?, coordinates: CLLocationCoordinate2D?, location: String?, routes: [String : (name: String?, stops: [(name: String?, elevation: Double?)])])
    var route: (name: String?, stops: [(name: String?, elevation: Double?)])
    var difficulty: String
    
    init(mountain m: (name: String?, nativeNames: [String]?, elevation: Double?, prominence: Double?, isolation: Double?, coordinates: CLLocationCoordinate2D?, location: String?, routes: [String : (name: String?, stops: [(name: String?, elevation: Double?)])]), route r: (name: String?, stops: [(name: String?, elevation: Double?)]), difficulty d: String) {
        mountain = m
        route = r
        difficulty = d
    }
    
    var flightsClimbed: UInt = 0
}
