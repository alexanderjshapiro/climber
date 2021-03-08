//
//  ClimberViewModel.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import Foundation
import HealthKit
import CoreLocation

class ClimberViewModel: ObservableObject {
    @Published private var climber = ClimberViewModel.createClimber()
    
    private static func createClimber() -> Climber {
        return Climber(mountain: mountains["default"]!)
    }
    
    // MARK: - Mountain Data
    static let mountains = [
        "default": (
            name: "None",
            nativeNames: ["None"],
            elevation: 0.0,
            prominence: 0.0,
            isolation: 0.0,
            coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(0.0), longitude: CLLocationDegrees(0.0)),
            location: "None",
            routes: [
                "none": (
                    name: "None",
                    stops: [
                        (name: "None", elevation: 0.0),
                    ]
                )
            ]
        ),
        "whitney": (
            name: "Mount Whitney",
            nativeNames: ["Too-man-i-goo-yah (Paiute)"],
            elevation: 4421.0,
            prominence: 3071.0,
            isolation: 2651000.0,
            coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(36.578581), longitude: CLLocationDegrees(-118.291995)),
            location: "Sequoia National Park / Inyo National Forest, California, U.S.",
            routes: [
                "southeastRidge": (
                    name: "Southeast ridge",
                    stops: [
                        (name: "Lone Pine", elevation: 1136.0),
                        (name: "Whitney Portal", elevation: 2552.0),
                        (name: "Outpost Camp", elevation: 3159.0),
                        (name: "Trail Camp", elevation: 3700.0),
                        (name: "Summit", elevation: 4421.0),
                    ]
                )
            ]
        ),
        "whitney2": (
            name: "Mount Whitney",
            nativeNames: ["Too-man-i-goo-yah (Paiute)"],
            elevation: 4421.0,
            prominence: 3071.0,
            isolation: 2651000.0,
            coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(36.578581), longitude: CLLocationDegrees(-118.291995)),
            location: "Sequoia National Park / Inyo National Forest, California, U.S.",
            routes: [
                "southeastRidge": (
                    name: "Southeast ridge",
                    stops: [
                        (name: "Lone Pine", elevation: 1136.0),
                        (name: "Whitney Portal", elevation: 2552.0),
                        (name: "Outpost Camp", elevation: 3159.0),
                        (name: "Trail Camp", elevation: 3700.0),
                        (name: "Summit", elevation: 4421.0),
                    ]
                )
            ]
        )
        //        "everest": (
        //            name: "Mount Everest",
        //            nativeNames: ["珠穆朗玛 (Chinese)","सगरमाथा (Nepali)","ཇོ་མོ་གླང་མ (Tibetan)"],
        //            elevation: 8848.86,
        //            prominence: 8848.86,
        //            isolation: 40008000,
        //            coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(36.578581), longitude: CLLocationDegrees(-118.291995)), // TODO
        //            location: "Nepal and China",
        //            range: "Mahalangur Himal, Himalayas",
        //            routes: [
        //                "southeastRidge": (
        //                    name: "Southeast ridge",
        //                    stops: [
        //                        ("Bay of Bengal", 0),
        //                        ("Kathmandu", 1400),
        //                        ("Lukla", 2860),
        //                        ("Namche Bazaar", 3440),
        //                        ("Base Camp", 5380),
        //                        ("Khumbu Icefall", 5486),
        //                        ("Camp I", 6065),
        //                        ("Western Cwm", 6100),
        //                        ("Camp II (Advanced Base Camp)", 6500),
        //                        ...
        //                    ]
        //                )
        //            ]
        //        )
    ]
    
    // MARK: - Health Data
    // Setting Up HealthKit
    // Ensure HealthKit’s Availability
    func healthDataIsAvailable() -> Bool {
        if HKHealthStore.isHealthDataAvailable() {
            print("health data is available")
            return true
        } else {
            print("health data is not available")
            return false
        }
    }
    
    // Create the HealthKit Store
    let healthStore = HKHealthStore()
    
    // Authorizing Access to Health Data
    // Request Permission from the User
    func authorizeHealthKitAccess() {
        if healthDataIsAvailable() {
            let flightsClimbedDataType = Set([HKObjectType.quantityType(forIdentifier: .flightsClimbed)!])
            
            healthStore.requestAuthorization(toShare: [], read: flightsClimbedDataType) { (success, error) in
                if success {
                    print("authorization flow has been completed")
                } else {
                    print("authorization flow failed with error")
                    print("\(error!.localizedDescription)")
                }
            }
        }
    }
    
    var startDate = Date.init(timeIntervalSinceNow: -7*24*60*60)
    var flightsClimbed: UInt = 0
    
    // Executing Statistical Queries
    func getFlightsClimbed() {
        // Create the Object Type and Predicate
        guard let flightsClimbedQuantityType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed) else {
            // This should never fail when using a defined constant
            fatalError("*** Unable to get the flights c type ***")
        }
        
        let endDate = Date()
        let withinPastWeek = HKQuery.predicateForSamples(
            withStart: startDate,
            end: endDate,
            options: .strictStartDate
        )
        
        // Create the Query
        let query = HKStatisticsQuery(
            quantityType: flightsClimbedQuantityType,
            quantitySamplePredicate: withinPastWeek,
            options: .cumulativeSum
        ) { (query, statisticsOrNil, errorOrNil) in
            
            guard let statistics = statisticsOrNil else {
                // Handle any errors here.
                return
            }
            
            let sum = statistics.sumQuantity()
            let totalFlightsClimbed = sum?.doubleValue(for: HKUnit.count())
            print(UInt(totalFlightsClimbed ?? 0))
            
            // Update your app here.
            
            // The results come back on an anonymous background queue.
            // Dispatch to the main queue before modifying the UI.
            
            DispatchQueue.main.async {
                // Update the UI here.
                self.climber.flightsClimbed = UInt(totalFlightsClimbed ?? 0.0)
            }
        }
        
        // Execute query
        healthStore.execute(query)
    }
    
    // MARK: - Access to model
    var name: String {climber.mountain.name}
    var nativeNames: [String] {climber.mountain.nativeNames}
    var elevation: Double {climber.mountain.elevation}
    var prominence: Double {climber.mountain.prominence}
    var isolation: Double {climber.mountain.isolation}
    var coordinates: CLLocationCoordinate2D {climber.mountain.coordinates}
    var location: String {climber.mountain.location}
    var routes: [String : (name: String, stops: [(name: String, elevation: Double)])] {climber.mountain.routes}
    var numFlightsClimbed: UInt {climber.flightsClimbed}
    
    // MARK: - Intents
    func createClimber() { climber = ClimberViewModel.createClimber() }
}
