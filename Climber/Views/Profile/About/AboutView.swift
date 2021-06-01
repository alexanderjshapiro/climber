//
//  AboutView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Climber")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Alexander Shapiro")
                    .foregroundColor(.secondary)
            }
            .padding()
            
            Divider()
            
            List {
                NavigationLink(
                    destination: TermsOfServiceView(),
                    label: {
                        Text("Terms of Service")
                    })
                
                NavigationLink(
                    destination: PrivacyPolicyView(),
                    label: {
                        Text("Privacy Policy")
                    })
                
                NavigationLink(
                    destination: LicensesView(),
                    label: {
                        Text("Licenses")
                    })
                
                NavigationLink(
                    destination: SpecialThanksView(),
                    label: {
                        Text("Special Thanks")
                    })
            }
            
            Spacer()
            
            VStack(spacing: 10) {
                HStack {
                    Text("Version")
                        .fontWeight(.bold)
                    Spacer()
                    Text((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!)
                        .font(Font.system(.body, design: .monospaced))
                    
                }
                
                Text("Copyright © 2021 Alexander Shapiro • All rights reserved.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationBarTitle(Text("About"), displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
