//
//  ClimberView.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

struct ClimberView: View {
    @ObservedObject var climber: ClimberViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("\(climber.name)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "gearshape")
                    }).font(.title)
                }
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(UIColor.secondarySystemFill))
                    VStack {
                        Image(systemName: "applelogo")
                            .resizable()
                            .redacted(reason: .placeholder)
                            .frame(width: nil, height: 200, alignment: .center)
                        Text("\(climber.numFlightsClimbed * 10) of \(Int(climber.elevation.rounded())) m")
                            .fontWeight(.bold)
                        Text("\(climber.numFlightsClimbed) of \(Int(climber.elevation.rounded() / 3)) flights")
                        
                    }.padding()
                }
                
                Text("Fetch Data")
                    .onTapGesture {
                        climber.getFlightsClimbed()
                    }
            }.padding()
        }
    }
}
