//
//  MountainsListView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/7/21.
//

import SwiftUI

struct MountainsListView: View {
    var modelData: ModelData
    @State private var searchText = ""
    @State private var currentlySearching = false
    
    @State private var sort: Sort = .alphabetical
    enum Sort {
        case alphabetical
        case elevation
        case new
    }
    
    
    var searchResults: [Mountain] {
        modelData.mountains
            .filter { mountain in
                mountain.name.contains(searchText) || searchText == ""
            }
            .sorted {
                switch (sort) {
                case .alphabetical:
                    return $0.name < $1.name
                case .elevation:
                    return $0.elevation > $1.elevation
                case .new:
                    return $0.id > $1.id
                }
            }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField(
                            "Search",
                            text: $searchText,
                            onEditingChanged: { _ in
                                currentlySearching = true
                                
                            },
                            onCommit: {
                                currentlySearching = false
                                
                            }
                        )
                        .autocapitalization(.words)
                        .foregroundColor(.primary)
                        
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                }
                
                Picker("Sort", selection: $sort) {
                    Text("A → Z").tag(Sort.alphabetical)
                    Text("Elevation").tag(Sort.elevation)
                    Text("Newly Added").tag(Sort.new)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("\(searchResults.count) Mountain\(searchResults.count != 1 ? "s" : "")")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)
            }
            .padding([.top, .leading, .trailing])
            .padding(.bottom, 6)
            
            Divider()
            
            List(searchResults) { mountain in
                NavigationLink(destination: MountainDetailView(mountain: mountain)) {
                    MountainsRowView(mountain: mountain)
                }
            }.animation(.easeInOut)
        }
    }
}

struct MountainsListView_Previews: PreviewProvider {
    static var previews: some View {
        MountainsListView(modelData: ModelData())
    }
}
