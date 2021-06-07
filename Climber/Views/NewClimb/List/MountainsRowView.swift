//
//  MountainsRowView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/8/21.
//

import SwiftUI

struct MountainsRowView: View {
    var mountain: Mountain
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(mountain.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(mountain.route)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack(alignment: .bottom, spacing: 3) {
                    Text("\(UInt(mountain.elevation))")
                        .font(.system(size: 16, design: .monospaced))
                    Text("m")
                }
                
                HStack(alignment: .bottom, spacing: 3) {
                    Text("\(UInt(mountain.elevation / 10))")
                        .font(.system(size: 16, design: .monospaced))
                        .foregroundColor(.secondary)
                    Text("flights")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical)
    }
}

struct MountainsRowView_Previews: PreviewProvider {
    static var previews: some View {
        MountainsRowView(mountain: Mountain.default)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
