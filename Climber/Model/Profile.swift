//
//  Profile.swift
//  Climber
//
//  Created by Alexander Shapiro on 5/31/21.
//

import SwiftUI
import HealthKit

struct Profile {
    var name: String
    var username: String
    
    private var imageName: String?
    var image: Image {
        (imageName != nil) ? Image(imageName!) : Image(systemName: "person.crop.circle")
    }
    
    var climb: Climb?
    
    static let `default` = Profile(name: "First Last", username: "username")
    
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
                //                flightsClimbed = UInt(totalFlightsClimbed ?? 0.0)
            }
        }
        
        // Execute query
        healthStore.execute(query)
    }
}
