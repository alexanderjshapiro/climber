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
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("\(climber.mountain.name ?? "No Active Climb")")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "gearshape")
                        }).font(.title)
                    }
                    NavigationLink(destination: NewClimberView(climber: climber)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(.green)
                            Text("Start a New Climb")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                        }
                    }
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(Color(UIColor.secondarySystemFill))
                        VStack {
                            Image(systemName: "applelogo")
                                .resizable()
                                .redacted(reason: .placeholder)
                                .frame(width: nil, height: 200, alignment: .center)
                            Text("\(climber.numFlightsClimbed * 10) of \(Int(climber.mountain.elevation?.rounded() ?? 0)) m")
                                .fontWeight(.bold)
                            Text("\(climber.numFlightsClimbed) of \(Int(climber.mountain.elevation?.rounded() ?? 0 / 3)) flights")
                            
                        }.padding()
                    }
                    
                    Text("Fetch Data")
                        .onTapGesture {
                            climber.getFlightsClimbed()
                        }
                }.padding(20)
            }.navigationBarHidden(true)
        }
    }
}

struct ClimberView_Previews: PreviewProvider {
    static var previews: some View {
        ClimberView(climber: ClimberViewModel())
    }
}
