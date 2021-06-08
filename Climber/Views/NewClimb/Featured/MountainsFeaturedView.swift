//
//  MountainsFeaturedView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/7/21.
//

import SwiftUI

struct MountainsFeaturedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var modelData: ModelData
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Divider()
                
                ScrollView {
                    NavigationLink(destination: MountainDetailView(mountain: Mountain.default)) {
                        VStack(spacing: 0) {
                            ZStack {
                                Rectangle()
                                    .frame(height: 400)
                                    .cornerRadius(25.0, corners: [.topLeft, .topRight])
                                    .foregroundColor(.tertiaryLabel)
                                
                                Rectangle()
                                    .frame(height: 400)
                                    .cornerRadius(25.0, corners: [.topLeft, .topRight])
                                    .foregroundColor(.accentColor)
                            }
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(25.0, corners: [.bottomLeft, .bottomRight])
                                    .foregroundColor(.tertiaryLabel)
                                
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        Text("Mountain of the Month")
                                            .font(.headline)
                                            .textCase(.uppercase)
                                            .foregroundColor(.secondary)
                                        Spacer()
                                    }
                                    
                                    Text("Discover the Grandest of the Tetons")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                            }
                        }
                        .padding()
                    }
                    
                    ForEach(0 ..< 5) { item in
                        NavigationLink(destination: MountainDetailView(mountain: Mountain.default)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(height: 400)
                                    .foregroundColor(.accentColor)
                            }
                            .padding()
                        }
                    }
                }
                .navigationBarTitle("Featured")
                .navigationBarItems(
                    leading:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Cancel")
                        }
                )
            }
        }
    }
}

struct MountainsFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        MountainsFeaturedView(modelData: ModelData())
    }
}
