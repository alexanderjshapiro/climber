//
//  ContentView.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ClimberView(modelData: modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12 Pro Max", "iPhone 8"], id: \.self) { device in
            ContentView()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
                .preferredColorScheme(.dark)
        }
    }
}
