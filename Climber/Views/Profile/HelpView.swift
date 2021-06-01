//
//  HelpView.swift
//  Climber
//
//  Created by Alexander Shapiro on 6/1/21.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Frequently Asked Questions")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                QuestionAnswer(q: "Example question one?") {
                    ZStack {
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(.secondary)
                        
                        Text("Placeholder")
                    }
                }
                
                QuestionAnswer(q: "Example question two?") {
                    ZStack {
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(.secondary)
                        
                        Text("Placeholder")
                    }
                }
                
                QuestionAnswer(q: "Example question three?") {
                    ZStack {
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(.secondary)
                        
                        Text("Placeholder")
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Additional Help")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Get more help, report bugs, or send feedback:")
                Link("climber@alexanderjshapiro.com", destination: URL(string: "mailto:climber@alexanderjshapiro.com")!)
            }
            .padding()
            
        }
        .navigationBarTitle(Text("Help"), displayMode: .inline)
    }
}

struct QuestionAnswer<Content: View>: View {
    var question: String
    var answer: Content
    
    @State private var showDetail = false
    
    init(q question: String, @ViewBuilder a answer: () -> Content) {
        self.question = question
        self.answer = answer()
    }
    
    var body: some View {
        Button(action: { showDetail.toggle() }) {
            VStack {
                HStack {
                    Text(question)
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .padding()
                }
                if showDetail {
                    answer
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
