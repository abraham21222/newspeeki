//
//  screen_2.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/3/24.
//
import SwiftUI
import PencilKit

struct Screen2: View {
    @State private var canvasView = PKCanvasView()
    private let loginAssetX = "Group 21"
    @State private var navigateToScreen3 = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.15)

                    // Image and Text View
                    VStack(spacing: 5) {
                        ImageView(imageName: "Image (1)", height: geometry.size.height * 0.275, scale: 0.9, geometry: geometry)
                        Text("As you know, growth requires work. Will you give it a fair shot?")
                            .font(.custom("Inter", size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        // Drawing Area
                        VStack {
                            Text("Promise yourself by drawing a checkmark")
                                .font(.custom("Inter", size: 16))
                                .padding(.top, geometry.size.height * 0.04)

                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .background(Color.gray.opacity(0.3))  // Set the background color of the drawing box to gray
                                    .frame(width: geometry.size.width * 0.9, height: 180)
                                
                                CanvasView(canvasView: $canvasView)
                                    .frame(width: geometry.size.width * 0.9, height: 180)
                                    .cornerRadius(12)
                            }
                         
                            NavigationLink(destination: Screen_3(), isActive: $navigateToScreen3) {
                                EmptyView()
                            }

                            Button(action: {
                                self.navigateToScreen3 = true
                            }) {
                                ImageView(imageName: loginAssetX, height: geometry.size.height * 0.10, scale: 1.0, geometry: geometry)
                            }
                            .padding(.top, geometry.size.height * 0.02)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 10) // Adjust pen thickness as needed
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.isUserInteractionEnabled = true
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // No dynamic updates required
    }
}





