//
//  BottomSheetView.swift
//  Climber
//
//  Created by Alexander Shapiro on 5/31/21.
//

import SwiftUI

struct BottomSheetView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                BlurView()
                VStack {
                    Capsule()
                        .frame(width: 38, height: 5)
                        .padding(6)
                        .foregroundColor(.gray)
                    Group {
                        VStack {
                            HStack {
                                VStack {
                                    HStack {
                                        Text("Mount Everest")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Southeast Ridge Route")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Spacer()
                                    }
                                }
                                
                                VStack {
                                    HStack {
                                        Text("5,309")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                    }
                                    
                                    HStack {
                                        Text("of 8848.86 m")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                
                            }
                            
                            ProgressView(value: 5309/8848.86)
                        }
                    }.padding()
                    Spacer()
                }
            }
            .frame(height: 300)
            .cornerRadius(25.0)
        }
        .edgesIgnoringSafeArea(.bottom)
        .offset(y: 25)
        .padding(.top, -25)
    }
}

struct BlurView: UIViewRepresentable {
    var effect: UIVisualEffect? = UIBlurEffect(style: .systemMaterial)
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
