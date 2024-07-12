//
//  screen_5.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/7/24.
//

import SwiftUI

// Usage example:
struct Screen_5: View {
    @State private var position: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToScreen6 = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Progress bar and "Question 1 of 10" section
                        VStack(spacing: 17) { // Increased from 15
                            ProgressBar(progress: 0.1)
                                .frame(width: geometry.size.width * 0.8, height: 10)
                                .padding(.horizontal, geometry.size.width * 0.1)
                                .padding(.top, 23) // Increased from 20
                            
                            HStack {
                                Image("Group 11 (1)")
                                    .frame(width: geometry.size.width * 0.1)
                                    .padding(.leading, geometry.size.width * 0.05)
                                
                                Spacer(minLength: 0)
                                
                                Text("Question 1 of 10")
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
                            
                            Image("Group 22")
                                .frame(width: geometry.size.width * 0.4)
                                .offset(y: 46) // Increased from 40
                                .padding(.leading, geometry.size.width * 0.08) // Increased from 0.08
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, geometry.size.width * 0.115) // Increased from 0.1
                        
                        Spacer().frame(height: geometry.size.height * 0.07) // Increased from 0.075
                        
                        // Custom slider
                        CustomSlider(
                            position: $position,
                            leftOption: "Eager to mingle and\nexchange business cards",
                            rightOption: "Wish I could blend\ninto the background."
                        )
                        
                        Spacer().frame(height: geometry.size.height * 0.08625) // Increased from 0.075
                        
                        // Navigation link and Group 21 image
                        NavigationLink(destination: Screen6(), isActive: $navigateToScreen6) {
                            EmptyView()
                        }
                        HStack {
                            Spacer()
                            Image("Group 21 (1)")
                                .padding(.trailing, geometry.size.width * 0.115) // Increased from 0.10
                                .padding(.bottom, geometry.size.height * 0.23) // Increased from 0.20
                                .onTapGesture {
                                    self.navigateToScreen6 = true
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
