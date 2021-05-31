//
//  Mountain.swift
//  Climber
//
//  Created by Alexander Shapiro on 5/31/21.
//

import SwiftUI
import CoreLocation

struct Mountain: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var otherNames: [String]
    var description: String
    
    var elevation: Double
    var prominence: Double
    var isolation: Double
    
    var location: String
    var range: String
//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
    
    var routes: [Route]
    
    struct Route: Hashable, Codable {
        var name: String
        var otherNames: [String]
        var description: String
        
        var stops: [Stop]
    }
    
    struct Stop: Hashable, Codable {
        var name: String
        var elevation: Double
    }
}
