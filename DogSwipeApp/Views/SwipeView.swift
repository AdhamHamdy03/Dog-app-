import SwiftUI

struct SwipeView: View {
    let breed: DogBreed
    @State private var dogImages: [String] = []
    @State private var currentIndex = 0
    @State private var offset = CGSize.zero
    @State private var accepted: [String] = []
    @State private var rejected: [String] = []
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                if currentIndex < dogImages.count {
                    ZStack {
                        // Show next card underneath
                        if currentIndex + 1 < dogImages.count {
                            CardView(imageName: dogImages[currentIndex + 1])
                                .opacity(0.5)
                                .scaleEffect(0.9)
                        }
                        
                        // Current card
                        CardView(imageName: dogImages[currentIndex])
                            .offset(offset)
                            .rotationEffect(.degrees(Double(offset.width / 20)))
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        offset = gesture.translation
                                    }
                                    .onEnded { gesture in
                                        withAnimation(.spring()) {
                                            if abs(offset.width) > 150 {
                                                // Swiped far enough
                                                if offset.width > 0 {
                                                    // Accepted (right swipe)
                                                    accepted.append(dogImages[currentIndex])
                                                    swipeRight()
                                                } else {
                                                    // Rejected (left swipe)
                                                    rejected.append(dogImages[currentIndex])
                                                    swipeLeft()
                                                }
                                            } else {
                                                // Return to center
                                                offset = .zero
                                            }
                                        }
                                    }
                            )
                            .overlay(
                                // Accept indicator
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.green, lineWidth: 5)
                                    .overlay(
                                        Text("LIKE")
                                            .font(.system(size: 40, weight: .bold))
                                            .foregroundColor(.green)
                                            .rotationEffect(.degrees(-30))
                                    )
                                    .opacity(offset.width > 50 ? Double(offset.width / 150) : 0)
                            )
                            .overlay(
                                // Reject indicator
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.red, lineWidth: 5)
                                    .overlay(
                                        Text("NOPE")
                                            .font(.system(size: 40, weight: .bold))
                                            .foregroundColor(.red)
                                            .rotationEffect(.degrees(30))
                                    )
                                    .opacity(offset.width < -50 ? Double(-offset.width / 150) : 0)
                            )
                    }
                    .padding()
                    
                    // Action buttons
                    HStack(spacing: 40) {
                        Button(action: {
                            withAnimation(.spring()) {
                                rejected.append(dogImages[currentIndex])
                                swipeLeft()
                            }
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 70, height: 70)
                                .background(Color.red)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                accepted.append(dogImages[currentIndex])
                                swipeRight()
                            }
                        }) {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 70, height: 70)
                                .background(Color.green)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.top, 20)
                    
                } else {
                    // All cards swiped
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.green)
                        
                        Text("All Done!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("You liked \(accepted.count) dogs")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Choose Another Breed")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle(breed.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadDogImages()
        }
    }
    
    private func loadDogImages() {
        dogImages = breed.getDogImages()
    }
    
    private func swipeRight() {
        offset = CGSize(width: 500, height: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            currentIndex += 1
            offset = .zero
        }
    }
    
    private func swipeLeft() {
        offset = CGSize(width: -500, height: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            currentIndex += 1
            offset = .zero
        }
    }
}

struct CardView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.6)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    NavigationView {
        SwipeView(breed: .golden)
    }
}
