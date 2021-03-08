//
//  ClimberView.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

struct OnboardingView: View {
    var viewSelector: ViewSelector
    
    var body: some View {
        TabView {
            Group {
                FirstOnboardingPage()
                OnboardingPage(title: "Page 2")
                OnboardingPage(title: "Page 3")
                OnboardingPage(title: "Page 4")
                LastOnboardingPage(viewSelector: viewSelector)
            }.padding(.horizontal).padding(.vertical, 60)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(
            Image("mountain1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct FirstOnboardingPage: View {
    var body: some View {
        VStack {
            Text("Welcome to Climber!")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Text("Swipe to continue →")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
        }
    }
}

struct OnboardingPage: View {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
        }
    }
}

struct LastOnboardingPage: View {
    var viewSelector: ViewSelector
    
    var body: some View {
        VStack {
            Text("Ready to climb?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(true, forKey: "didCompleteOnboarding")
                viewSelector.segueToClimberView()
            }) {
                Text("Let's go!")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Rectangle().foregroundColor(.blue).cornerRadius(10))
        }
    }
}
