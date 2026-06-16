import SwiftUI

struct BreedSelectionView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(DogBreed.allCases, id: \.self) { breed in
                        NavigationLink(destination: SwipeView(breed: breed)) {
                            BreedCard(breed: breed)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Choose a Dog Breed")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct BreedCard: View {
    let breed: DogBreed
    
    var body: some View {
        VStack {
            Image(breed.iconImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(breed.displayName)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .frame(width: 160, height: 200)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    BreedSelectionView()
}
