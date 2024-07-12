//
//  screen_8.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/8/24.
//

import SwiftUI

struct Screen8: View {
    @State private var position: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToScreen9 = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 0) {
                        // Progress bar and "Question 1 of 10" section
                        VStack(spacing: 17) { // Increased from 15
                            ProgressBar(progress: 0.4)
                                .frame(width: geometry.size.width * 0.8, height: 10)
                                .padding(.horizontal, geometry.size.width * 0.1)
                                .padding(.top, 23) // Increased from 20
                            
                            HStack {
                                Image("Group 11 (1)")
                                    .frame(width: geometry.size.width * 0.1)
                                    .padding(.leading, geometry.size.width * 0.05)
                                
                                Spacer(minLength: 0)
                                
                                Text("Question 4 of 10")
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
                            
                            Image("Group 20 (1)")
                                .frame(width: geometry.size.width * 0.4)
                                .offset(y: 46) // Increased from 40
                                .padding(.leading, geometry.size.width * 0.092) // Increased from 0.08
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, geometry.size.width * 0.115) // Increased from 0.1
                        
                        Spacer().frame(height: geometry.size.height * 0.08625) // Increased from 0.075
                        
                        // Custom slider
                        CustomSlider(
                            position: $position,
                            leftOption: "Politely decline and\nsuggest alternatives.",
                            rightOption: "End up saying yes to\navoid discomfort."
                        )

                        Spacer().frame(height: geometry.size.height * 0.08625) // Increased from 0.075
                        
                        // Navigation link and Group 21 image
                        NavigationLink(destination: Screen9(), isActive: $navigateToScreen9) {
                            EmptyView()
                        }
                        HStack {
                            Spacer()
                            Image("Group 21 (1)")
                                .padding(.trailing, geometry.size.width * 0.115) // Increased from 0.10
                                .padding(.bottom, geometry.size.height * 0.23) // Increased from 0.20
                                .onTapGesture {
                                    self.navigateToScreen9 = true
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
