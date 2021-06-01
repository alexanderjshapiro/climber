//
//  ClimberBackgroundView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct ClimberBackgroundView: View {
    var body: some View {
        ZStack {
            Image("mountain1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Text("ClimberBackgroundView Placeholder")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
}

struct ClimberBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ClimberBackgroundView()
    }
}
