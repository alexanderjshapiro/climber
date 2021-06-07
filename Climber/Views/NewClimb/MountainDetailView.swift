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
            ZStack(alignment: .bottomLeading) {
                Image("mountain1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading) {
                    Text(mountain.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    
                    Text(mountain.route)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                }
                .padding()
            }
            
            VStack(alignment: .leading) {
                Text("Ex voluptatem et et atque minima. Nostrum porro illo est nostrum soluta. Veniam modi commodi odit qui tenetur dolorem porro. Magnam aut quasi optio consectetur debitis. Eaque voluptatibus sit sunt porro sunt doloremque iure sit.")
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                
                HStack {
                    HStack(alignment: .bottom, spacing: 3) {
                        Text("\(UInt(mountain.elevation))")
                            .font(.system(size: 28, design: .monospaced))
                        Text("m")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Text("\(UInt(mountain.elevation / 10))")
                            .font(.system(size: 28, design: .monospaced))
                            .foregroundColor(.secondary)
                        Text("flights")
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                }
                
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
                .layoutPriority(-1)
            }
            .padding()
        }
    }
}

struct MountainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MountainDetailView(mountain: Mountain.default)
    }
}
