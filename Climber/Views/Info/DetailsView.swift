//
//  DetailsView.swift
//  Climber
//
//  Created by Alexander Shapiro on 5/31/21.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            DetailSection(title: "Current Stage", showSeeAll: true) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                    Text("Placeholder")
                        .padding(.vertical, 100)
                }
            }
            
            DetailSection(title: "Quick Facts", showSeeAll: false) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                    Text("Placeholder")
                        .padding(.vertical, 100)
                }
            }
            
            AbandonButtonView()
        }
        .padding()
    }
}

struct DetailSection<Content: View>: View {
    var title: String
    var showSeeAll: Bool
    var content: Content
    
    init(title: String, showSeeAll: Bool, @ViewBuilder content: () -> Content) {
        self.title = title
        self.showSeeAll = showSeeAll
        self.content = content()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(0)
                Spacer()
                if showSeeAll {
                    Button(action: {}) {
                        Text("See All")
                            .font(.subheadline)
                    }
                }
            }
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.secondary)
            
            content
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
