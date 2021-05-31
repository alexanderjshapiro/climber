//
//  ContentView.swift
//  Climber
//
//  Created by Alexander Shapiro on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bottomSheetPosition: BottomSheetPosition = .top
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            //A simple Black background
            Image("mountain1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
                .bottomSheet(bottomSheetPosition: $bottomSheetPosition, headerContent: {
                    SummaryView()
                }, mainContent: {
                    InfoView()
                        .opacity(bottomSheetPosition == BottomSheetPosition.bottom ? 0 : 1)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12 Pro Max", "iPhone 8"], id: \.self) { device in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
                .preferredColorScheme(.dark)
        }
    }
}
