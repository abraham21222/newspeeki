//
//  screen_1.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/2/24.
//
import SwiftUI

struct Screen1: View {
    private let assets = ["speekilogo", "carousel_first_screen_3", "carosuel_first_screen_4"]
    @State private var currentIndex = 0
    private let getStartedAsset = "Get_started"
    private let loginAsset = "Group 20"
    
    private let descriptions = [
        "Learn to manage your emotions\nin 5 min per day",
        "Unlimited AI analysis\ninto your facial expression,\nand tone of voice",
        "Become charismatic with smart AI"
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Spacer().frame(height: geometry.size.height * 0.13)
                    
                    ImageView(imageName: assets[currentIndex], height: geometry.size.height * 0.37, geometry: geometry)
                    
                    Spacer().frame(height: geometry.size.height * 0.015)
                    
                    VStack(spacing: 5) {
                        Text("Speeki")
                            .font(.custom("Poppins-SemiBold", size: 32))
                            .foregroundColor(Color(hex: "6442EF"))
                        
                        Text(descriptions[currentIndex])
                            .font(.custom("Inter", size: 17))
                            .multilineTextAlignment(.center)
                    }
                    .frame(height: geometry.size.height * 0.20)
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        NavigationLink(destination: Screen2()) {
                            ImageView(imageName: getStartedAsset, height: geometry.size.height * 0.10, scale: 0.9, geometry: geometry)
                        }
                        
                        ImageView(imageName: loginAsset, height: geometry.size.height * 0.10, scale: 0.9, geometry: geometry)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, geometry.size.height * 0.08)
                }
                .frame(width: geometry.size.width)
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: startImageCycling)
    }
    
    private func startImageCycling() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % assets.count
        }
    }
}




struct ImageWidthModifier: ViewModifier {
    let imageName: String
    let geometry: GeometryProxy
    
    func body(content: Content) -> some View {
        if imageName == "carosuel_first_screen_4" {
            content
                .frame(width: geometry.size.width * 0.7) // 70% of the original width
        } else {
            content
        }
    }
}


