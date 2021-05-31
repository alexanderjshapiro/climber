//
//  NewClimberView.swift
//  Climber
//
//  Created by Alexander Shapiro on 3/10/21.
//

import SwiftUI

struct NewClimberView: View {
    @ObservedObject var climber: ClimberViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var isDone: Bool { climber.newClimberStep == 4 }
    @State var mountain = "default"
    @State var route = "default"
    @State var difficulty = "default"
    
    var body: some View {
        VStack {
            NewClimberStep(1, "Choose a mountain", climber: climber) {
                Button(
                    action: {
                        mountain = "whitney"
                        climber.changeNewClimberToStep(2)
                    }
                ) {
                    Text("Mount Whitney (Placeholder)")
                }
            }
            NewClimberStep(2, "Choose a route", climber: climber) {
                Button(
                    action: {
                        route = "southeastRidge"
                        climber.changeNewClimberToStep(3)
                    }
                ) {
                    Text("Southeast Ridge (Placeholder)")
                }
            }
            NewClimberStep(3, "Select a difficulty", climber: climber) {
                VStack(spacing: 20) {
                Button(
                    action: {
                        difficulty = "Easy"
                        climber.changeNewClimberToStep(4)
                    }
                ) {
                    NewClimberDifficultyOption(symbol: "🗻", difficulty: (level: "Easy", multiplier: 10))
                }
                Button(
                    action: {
                        difficulty = "Medium"
                        climber.changeNewClimberToStep(4)
                    }
                ) {
                    NewClimberDifficultyOption(symbol: "⛰", difficulty: (level: "Medium", multiplier: 5))
                }
                Button(
                    action: {
                        difficulty = "Hard"
                        climber.changeNewClimberToStep(4)
                    }
                ) {
                    NewClimberDifficultyOption(symbol: "🌋", difficulty: (level: "Hard", multiplier: 1))
                }
                }
            }
            NewClimberStep(4, "Summary", climber: climber) {
                Text("Mountain: " + mountain)
                Text("Route: " + route)
                Text("Difficulty: " + difficulty)
                Spacer()
            }
            Button(
                action: {
                    climber.createClimber(mountain: mountain, route: route, difficulty: difficulty)
                    presentationMode.wrappedValue.dismiss()
                }
            ) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(height: 50)
                        .foregroundColor(isDone ? Color.green : Color.gray)
                    Text("Start Climb")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .disabled(!isDone)
        }.navigationBarTitle("Start a New Climb")
    }
}

struct NewClimberStep<Content: View> : View  {
    @ObservedObject var climber: ClimberViewModel
    
    var stepNumber: UInt
    var title: String
    var content: Content
    
    init(_ stepNumber: UInt, _ title: String, climber: ClimberViewModel, @ViewBuilder content: () -> Content) {
        self.stepNumber = stepNumber
        self.title = title
        self.climber = climber
        self.content = content()
    }
    
    var body: some View {
        header
        if (climber.newClimberStep == stepNumber) {
            content
                .padding(20)
                .foregroundColor(.primary)
            Spacer()
        }
    }
    
    var header: some View {
        Button(
            action: {
                if (stepNumber < climber.newClimberStep) {
                    climber.changeNewClimberToStep(stepNumber)
                }
            }
        ) {
            HStack {
                Text("\(stepNumber): \(title)")
                    .foregroundColor(.primary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, climber.newClimberStep != stepNumber ? 10 : 0)
                    .padding(.all, climber.newClimberStep == stepNumber ? 20 : 10)
                
                Spacer()
            }.background(climber.newClimberStep == stepNumber ? Color.green : Color.gray)
        }.disabled(stepNumber >= climber.newClimberStep)
    }
}

struct NewClimberDifficultyOption: View {
    var symbol: String
    var difficulty: (level: String, multiplier: Int)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(Color(.systemGray4))
                HStack {
                    Text(symbol)
                        .font(.largeTitle)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(difficulty.level)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("1 flight of stairs → \(3 * difficulty.multiplier) meters")
                        Text("\(difficulty.multiplier)× multipler").foregroundColor(Color(.systemGray))
                    }
                    Spacer()
                }.padding()
            }
        }
    }
    
    private let fontScalingFactor: CGFloat = 0.7
    private func fontSize(for size: CGSize) -> CGFloat { min(size.width, size.height) * fontScalingFactor }
}

struct NewClimberView_Previews: PreviewProvider {
    static var previews: some View {
        NewClimberView(climber: ClimberViewModel())
    }
}
