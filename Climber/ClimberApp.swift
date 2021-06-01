//
//  ClimberApp.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

@main
struct ClimberApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
