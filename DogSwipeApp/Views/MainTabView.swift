import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Page 1: Breed Selection (existing)
            BreedSelectionView()
                .tabItem {
                    Label("Breeds", systemImage: "pawprint.fill")
                }
            
            // Page 2: Store
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "cart.fill")
                }
            
            // Page 3: Emergency Map
            EmergencyMapView()
                .tabItem {
                    Label("Emergency", systemImage: "exclamationmark.triangle.fill")
                }
            
            // Page 4: Events
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            
            // Page 5: Book Vet
            VetBookingView()
                .tabItem {
                    Label("Vet", systemImage: "stethoscope")
                }
            
            // Page 6: Settings & Sign In
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    MainTabView()
}
