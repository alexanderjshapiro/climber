//
//  NewClimbView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/7/21.
//

import SwiftUI

struct NewClimbView: View {
    var modelData: ModelData
    @State private var selection: Tab = .list
    
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
            
            MountainsListView(modelData: modelData)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .navigationBarTitle(Text("Select a Mountain"), displayMode: .inline)
    }
}

struct NewClimbView_Previews: PreviewProvider {
    static var previews: some View {
        NewClimbView(modelData: ModelData())
    }
}
