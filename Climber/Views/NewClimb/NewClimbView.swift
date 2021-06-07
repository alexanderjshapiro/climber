//
//  NewClimbView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/7/21.
//

import SwiftUI

struct NewClimbView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MountainsFeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            MountainsListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct NewClimbView_Previews: PreviewProvider {
    static var previews: some View {
        NewClimbView()
    }
}
