//
//  SummaryView.swift
//  Climber
//
//  Created by Alexander Shapiro on 5/31/21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("Mount Everest")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Southeast Ridge Route")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                
                VStack {
                    HStack {
                        Text("5,486")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text("of 8,848.86 m")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            ProgressView(value: 5486/8848.86)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
