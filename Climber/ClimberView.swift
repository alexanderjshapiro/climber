//
//  ClimberView.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

struct ClimberView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Mount Everest")
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
                        Text("24,050 ft of 29,035 ft")
                            .fontWeight(.bold)
                        
                    }.padding()
                }
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClimberView()
    }
}
