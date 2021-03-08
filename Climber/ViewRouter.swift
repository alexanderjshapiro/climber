//
//  ClimberView.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

class ViewSelector: ObservableObject {
    @Published var currentPage: String
    
    init() {
        // Reset onboarding key
        // UserDefaults.standard.set(false, forKey: "didCompleteOnboarding")
        
        if !UserDefaults.standard.bool(forKey: "didCompleteOnboarding") {
            currentPage = "onboardingView"
        } else {
            currentPage = "homeView"
        }
    }
    
    func segueToClimberView() {
        currentPage = "homeView"
    }
}

struct ViewRouter: View {
    @ObservedObject var viewSelector: ViewSelector
    
    var body: some View {
        if viewSelector.currentPage == "onboardingView" {
            OnboardingView(viewSelector: viewSelector)
        } else {
            ClimberView(climber: ClimberViewModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClimberView(climber: ClimberViewModel())
        OnboardingView(viewSelector: ViewSelector())
    }
}
