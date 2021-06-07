//
//  AbandonButtonView.swift
//  Climber
//
//  Created by Alexander Shapiro on 5/31/21.
//

import SwiftUI

struct AbandonButtonView: View {
    @State var showAbandonClimbActionSheet: Bool = false
    
    var abandonClimbActionSheet: ActionSheet {
        ActionSheet(title: Text("Confirm Abandon Climb"), message: Text("Are you sure you want to abandon the current climb? All progress will be lost and cannot be recovered."), buttons: [
            .destructive(Text("Abandon Climb")) {
                print("abandoned")
            },
            .default(Text("Cancel")) {
                print("canceled")
            }
        ])
    }
    
    var body: some View {
        Button(action: { showAbandonClimbActionSheet.toggle() }) {
            Text("Abandon Climb")
                .foregroundColor(.red)
        }
        .padding()
        .actionSheet(isPresented: $showAbandonClimbActionSheet, content: { abandonClimbActionSheet })
    }
}

struct AbandonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AbandonButtonView()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
