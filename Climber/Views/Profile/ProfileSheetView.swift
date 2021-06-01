//
//  ProfileSheetView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct ProfileSheetView: View {
    var profile: Profile
    @Binding var isShowingProfileSheet: Bool
    
    var body: some View {
        NavigationView {
            ProfileView(profile)
            .navigationBarTitle(Text("Profile"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                isShowingProfileSheet = false
            }) {
                Text("Done").bold()
            })
        }
    }
}
