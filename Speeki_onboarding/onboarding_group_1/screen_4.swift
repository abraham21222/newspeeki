//
//  screen_4.swift
//  Speeki
//
//  Created by Abraham Bloom on 7/5/24.
//


import SwiftUI



struct EmojiTextView: View {
    var emoji: String
    var text: String
    @State private var isTapped = false // State to track if the view has been tapped

    var body: some View {
        HStack(spacing: 6) { // Increased spacing between emoji and text
            Text(emoji)
                .padding(.leading, 10) // Space from the left edge for emoji
            Text(text)
                .font(.custom("Inter-Regular", size: 14))
        }
        .padding(.vertical, 15) // Increased vertical padding for more height
        .padding(.horizontal, 10) // Horizontal padding to keep content aligned
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) // Content aligned to the left
        .background(isTapped ? Color.green.opacity(0.1
                                                  ) : Color.white) // Background color changes when tapped
        .cornerRadius(15) // Rounded corners
        .shadow(radius: 3) // Optional shadow for depth
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 0.5) // Gray stroke for border definition
        )
        .onTapGesture {
            isTapped.toggle() // Toggle the isTapped state to change the background color
        }
    }
}


// Main view that uses the ProgressBar component
struct Screen4: View {
    @State private var navigateToScreen5 = false
    private let loginAssetX = "Group 19 (1)"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) { // Spacing between the progress bar and the image
                GeometryReader { geometry in
                    VStack(spacing: 15) { // Spacing between the progress bar and the image within the GeometryReader
                        ProgressBar(progress: 0.1)  // 10% progress
                            .frame(width: geometry.size.width * 0.8, height: 10) // Adjusted width to 80% of parent's width
                            .padding(.horizontal, geometry.size.width * 0.1) // Adjusted horizontal padding to center the bar
                        
                        Image("Group 11 (1)")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.leading, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 10)
                            .onTapGesture {
                                                 self.presentationMode.wrappedValue.dismiss() // Dismisses the view when tapped
                                             }
                        
                        Text("What do you most hope to improve with this app?")
                            .font(.custom("Inter", size: 24)) // Inter font, size 24
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.leading, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 20)
                        
                        EmojiTextView(emoji: "💰", text: "Professional relationships")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.horizontal, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 20)
                        
                        EmojiTextView(emoji: "💖", text: "Romantic communication")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.horizontal, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 1)
                        EmojiTextView(emoji: "🐵", text: "Decrease Social Anxiety")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.horizontal, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 1)
                        EmojiTextView(emoji: "💡", text: "Become aware of my communication flaws")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.horizontal, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 1)
                        EmojiTextView(emoji: "🤩", text: "Enhance Charisma")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.horizontal, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 1)
                        EmojiTextView(emoji: "✏️", text: "Something else")
                            .frame(maxWidth: .infinity, alignment: .leading) // Aligns the image to the left
                            .padding(.horizontal, geometry.size.width * 0.1) // Ensures the image aligns with the left edge of the progress bar
                            .padding(.top, 1)
                        
                        NavigationLink(destination: Screen_5(), isActive: $navigateToScreen5) {
                            Button(action: {
                                self.navigateToScreen5 = true
                            }) {
                                ImageView(imageName: loginAssetX, height: geometry.size.height * 0.10, scale: 0.9, geometry: geometry)
                                    .padding(.top, geometry.size.height * 0.05)
                                
                            }
                        }

                    }
                }
                .padding(.top, 20) // Adjust the top padding as needed
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        }
  
}

// SwiftUI Preview
struct Screen4_Previews: PreviewProvider {
    static var previews: some View {
        Screen4()
    }
}
