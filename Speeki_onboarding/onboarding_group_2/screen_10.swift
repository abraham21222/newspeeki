//
//  screen_10.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/8/24.
//

import SwiftUI

struct Screen10: View {
    @State private var position: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToScreen11 = false
    private let loginAssetX = "Group 34"
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 0) {
                        // Progress bar and "Question 1 of 10" section
                        VStack(spacing: 17) { // Increased from 15
                            ProgressBar(progress: 0.5)
                                .frame(width: geometry.size.width * 0.8, height: 10)
                                .padding(.horizontal, geometry.size.width * 0.1)
                                .padding(.top, 23) // Increased from 20
                            
                            HStack {
                                Image("Group 11 (1)")
                                    .frame(width: geometry.size.width * 0.1)
                                    .padding(.leading, geometry.size.width * 0.05)
                                
                                Spacer(minLength: 0)
                                
                                Text("Question 5 of 10")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "C3C3C3"))
                                    .lineLimit(1)
                                    .padding(.horizontal, geometry.size.width * 0.10)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Spacer(minLength: 0)
                                
                                Color.clear.frame(width: geometry.size.width * 0.1 + geometry.size.width * 0.05)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 11.5) // Increased from 10
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                        
                        Spacer().frame(height: geometry.size.height * 0.08625) // Increased from 0.075
                        
                        // Speeki logo and Group 20 image
                        HStack(alignment: .top) {
                            Image("speekilogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.4 * 0.9)
                                .padding(.leading, geometry.size.width * -0.1)
                            
                            Image("Group 26")
                                .frame(width: geometry.size.width * 0.4)
                                .offset(y: 46) // Increased from 40
                                .padding(.leading, geometry.size.width * 0.092) // Increased from 0.08
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, geometry.size.width * 0.115) // Increased from 0.1
                        
                        Spacer().frame(height: geometry.size.height * 0.08625) // Increased from 0.075
                        
                        Image("Group 33")
                        
                        // Custom slider
//                        CustomSlider(
//                            position: $position,
//                            leftOption: "Eager to mingle and\nexchange business cards",
//                            rightOption: "Wish I could blend\ninto the background."
//                        )
                        
                        Spacer().frame(height: geometry.size.height * 0.08625) // Increased from 0.075
                        
                        NavigationLink(destination: Screen11(), isActive: $navigateToScreen11) {
                            Button(action: {
                                self.navigateToScreen11 = true
                            }) {
                                ImageView(imageName: loginAssetX, height: geometry.size.height * 0.10, scale: 0.9, geometry: geometry)
                                    .padding(.top, geometry.size.height * 0.05)
                                
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}
