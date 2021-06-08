//
//  ClimberView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct ClimberView: View {
    var modelData: ModelData
    
    @State private var bottomSheetPosition: BottomSheetPosition = .bottom
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ClimberBackgroundView()
                
                ProfileButton(profile: modelData.profile)
            }
            .bottomSheet(
                bottomSheetPosition: $bottomSheetPosition,
                options: [.notResizeable],
                headerContent: {
                    if (modelData.profile.climb != nil) {
                        SummaryView()
                    } else {
                        NewClimbButton(modelData: modelData)
                    }
                },
                mainContent: {
                    if (modelData.profile.climb != nil) {
                        DetailsView()
                            .opacity(bottomSheetPosition == BottomSheetPosition.bottom ? 0 : 1)
                    }
                }
            )
            .navigationBarHidden(true)
        }
    }
}

struct ProfileButton: View {
    var profile: Profile
    @State private var isShowingProfileSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isShowingProfileSheet.toggle() }) {
                    profile.image
                        .font(.largeTitle)
                }
                .padding()
                .sheet(isPresented: $isShowingProfileSheet) {
                    ProfileSheetView(profile: profile, isShowingProfileSheet: $isShowingProfileSheet)
                }
            }
            Spacer()
        }
    }
}

struct NewClimbButton: View {
    var modelData: ModelData
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: NewClimbView(modelData: modelData)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.accentColor)
                        Text("New Climb")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ClimberView_Previews: PreviewProvider {
    static var previews: some View {
        ClimberView(modelData: ModelData())
    }
}
