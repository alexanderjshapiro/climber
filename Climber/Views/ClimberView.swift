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
        ZStack {
            ClimberBackgroundView()
            
            ProfileButton(profile: modelData.profile)
        }
        .bottomSheet(
            bottomSheetPosition: $bottomSheetPosition,
            headerContent: {
                SummaryView()
            },
            mainContent: {
                InfoView()
                    .opacity(bottomSheetPosition == BottomSheetPosition.bottom ? 0 : 1)
            }
        )
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

struct ClimberView_Previews: PreviewProvider {
    static var previews: some View {
        ClimberView(modelData: ModelData())
    }
}