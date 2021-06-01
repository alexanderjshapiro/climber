//
//  ProfileView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct ProfileView: View {
    var profile: Profile
    
    init(_ profile: Profile) {
        self.profile = profile
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ProfileInfo(profile)
            
            Divider()
            
            ZStack {
                Rectangle()
                    .foregroundColor(.secondary)
                
                Text("Placeholder")
            }
            
            Divider()
            
            HStack {
                Spacer()
                
                NavigationLink(
                    destination: HelpView(),
                    label: {
                        Text("Help")
                    })
                
                Spacer()
                
                NavigationLink(
                    destination: AboutView(),
                    label: {
                        Text("About")
                    })
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(Profile.default)
    }
}
