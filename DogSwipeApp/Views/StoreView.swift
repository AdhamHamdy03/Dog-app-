import SwiftUI

struct StoreItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let description: String
}

struct StoreView: View {
    let storeItems = [
        StoreItem(name: "Dog Food Premium", price: 49.99, imageName: "bag.fill", description: "High quality dog food 10kg"),
        StoreItem(name: "Dog Toy Ball", price: 12.99, imageName: "tennisball.fill", description: "Durable rubber ball"),
        StoreItem(name: "Dog Leash", price: 24.99, imageName: "link", description: "6ft adjustable leash"),
        StoreItem(name: "Dog Bed Deluxe", price: 89.99, imageName: "bed.double.fill", description: "Comfortable orthopedic bed"),
        StoreItem(name: "Dog Shampoo", price: 15.99, imageName: "drop.fill", description: "Natural ingredients"),
        StoreItem(name: "Dog Collar", price: 19.99, imageName: "circle", description: "Adjustable with ID tag")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(storeItems) { item in
                        StoreItemCard(item: item)
                    }
                }
                .padding()
            }
            .navigationTitle("Dog Store")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct StoreItemCard: View {
    let item: StoreItem
    @State private var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Product Image
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.blue.opacity(0.1))
                    .frame(height: 120)
                
                Image(systemName: item.imageName)
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
            }
            
            // Product Name
            Text(item.name)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.primary)
            
            // Description
            Text(item.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            // Price and Buy Button
            HStack {
                Text("$\(String(format: "%.2f", item.price))")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                Spacer()
                
                Button(action: {
                    showingAlert = true
                }) {
                    Image(systemName: "cart.badge.plus")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .alert("Added to Cart", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("\(item.name) has been added to your cart!")
        }
    }
}

#Preview {
    StoreView()
}
