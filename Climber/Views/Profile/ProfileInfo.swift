//
//  ProfileInfo.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct ProfileInfo: View {
    var profile: Profile
    
    init(_ profile: Profile) {
        self.profile = profile
    }
    
    var body: some View {
        HStack {
            profile.image
                .font(Font.system(size: 64.0))
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(profile.username)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo(Profile.default)
            .previewLayout(.fixed(width: 500, height: 200))
    }
}
