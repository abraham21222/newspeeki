//
//  screen_3.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/4/24.
//
import SwiftUI

struct Screen_3: View {
    @State private var navigateToScreen3 = false
    private let loginAssetX = "Group 21"
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.25)
                    
                    // Image and Text View
                    VStack(spacing: 15) {
                        ImageView(imageName: "Image (2)", height: geometry.size.height * 0.275, scale: 0.9, geometry: geometry)
                        
                        Text("Let's personalize Speeki for you!")
                            .font(.custom("Inter", size: 24))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, geometry.size.height * 0.07)
                        
                        Text("Reflect on yourself over a few question to get a Meyers Briggs score adapted for conversational personality")
                            .font(.custom("Inter", size: 17))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding(.top, geometry.size.height * 0.005)
                            .padding(.bottom, geometry.size.height * 0.05)
                        
                        NavigationLink(destination: Screen4(), isActive: $navigateToScreen3) {
                            Button(action: {
                                self.navigateToScreen3 = true
                            }) {
                                ImageView(imageName: loginAssetX, height: geometry.size.height * 0.10, scale: 0.9, geometry: geometry)
                                    .padding(.top, geometry.size.height * 0.01)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

