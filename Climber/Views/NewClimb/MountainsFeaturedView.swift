//
//  MountainsFeaturedView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/7/21.
//

import SwiftUI

struct MountainsFeaturedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Text("MountainsFeaturedView")
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

struct MountainsFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        MountainsFeaturedView()
    }
}
