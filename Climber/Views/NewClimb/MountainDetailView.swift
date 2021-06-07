//
//  MountainDetailView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/7/21.
//

import SwiftUI

struct MountainDetailView: View {
    var mountain: Mountain
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("mountain1")
                .resizable()
                .frame(height: 300)
            Text(mountain.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("\(mountain.elevation)")
            Spacer().layoutPriority(1)
            Button(action: { print("begin climb") }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.accentColor)
                    Text("Begin Climb")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct MountainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MountainDetailView(mountain: Mountain.default)
    }
}
