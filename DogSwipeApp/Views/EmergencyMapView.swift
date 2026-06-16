import SwiftUI
import MapKit

struct StraydogLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let message: String
    let imageName: String
    let reportedBy: String
    let timestamp: Date
}

struct EmergencyMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var straydogs: [StraydogLocation] = [
        StraydogLocation(
            coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            message: "Injured dog near park, needs immediate help!",
            imageName: "dog.circle.fill",
            reportedBy: "John D.",
            timestamp: Date().addingTimeInterval(-3600)
        ),
        StraydogLocation(
            coordinate: CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4094),
            message: "Lost puppy, looks scared and hungry",
            imageName: "dog.circle.fill",
            reportedBy: "Sarah M.",
            timestamp: Date().addingTimeInterval(-7200)
        ),
        StraydogLocation(
            coordinate: CLLocationCoordinate2D(latitude: 37.7649, longitude: -122.4294),
            message: "Stray dog wandering on busy street",
            imageName: "dog.circle.fill",
            reportedBy: "Mike R.",
            timestamp: Date().addingTimeInterval(-1800)
        )
    ]
    
    @State private var selectedDog: StraydogLocation?
    @State private var showingReportSheet = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                // Map
                Map(coordinateRegion: $region, annotationItems: straydogs) { dog in
                    MapAnnotation(coordinate: dog.coordinate) {
                        Button(action: {
                            selectedDog = dog
                        }) {
                            VStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.red)
                                    .background(
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 40, height: 40)
                                    )
                                    .shadow(radius: 3)
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                
                // Zoom Controls
                VStack {
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 12) {
                            // Zoom In Button
                            Button(action: {
                                withAnimation {
                                    region.span.latitudeDelta /= 2
                                    region.span.longitudeDelta /= 2
                                }
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.primary)
                                    .frame(width: 44, height: 44)
                                    .background(Color(UIColor.systemBackground))
                                    .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                            
                            // Zoom Out Button
                            Button(action: {
                                withAnimation {
                                    region.span.latitudeDelta *= 2
                                    region.span.longitudeDelta *= 2
                                }
                            }) {
                                Image(systemName: "minus")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.primary)
                                    .frame(width: 44, height: 44)
                                    .background(Color(UIColor.systemBackground))
                                    .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                        }
                        .padding(.trailing, 16)
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                
                // Selected Dog Info Card
                if let dog = selectedDog {
                    VStack {
                        Spacer()
                        
                        DogInfoCard(dog: dog, onClose: {
                            selectedDog = nil
                        })
                        .padding()
                        .transition(.move(edge: .bottom))
                    }
                }
                
                // Report Button
                VStack {
                    Spacer()
                    
                    if selectedDog == nil {
                        Button(action: {
                            showingReportSheet = true
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                Text("Report Stray Dog")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(25)
                            .shadow(radius: 5)
                        }
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationTitle("Emergency Map")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingReportSheet) {
                ReportStrayDogView(isPresented: $showingReportSheet)
            }
        }
    }
}

struct DogInfoCard: View {
    let dog: StraydogLocation
    let onClose: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: dog.imageName)
                    .font(.system(size: 50))
                    .foregroundColor(.red)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Emergency Report")
                        .font(.headline)
                        .foregroundColor(.red)
                    
                    Text("Reported by \(dog.reportedBy)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(timeAgoString(from: dog.timestamp))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: onClose) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.gray)
                }
            }
            
            Divider()
            
            Text(dog.message)
                .font(.body)
                .foregroundColor(.primary)
            
            HStack(spacing: 12) {
                Button(action: {
                    // Open navigation
                }) {
                    HStack {
                        Image(systemName: "location.fill")
                        Text("Navigate")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Call emergency
                }) {
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("Call Help")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    private func timeAgoString(from date: Date) -> String {
        let seconds = Int(Date().timeIntervalSince(date))
        let minutes = seconds / 60
        let hours = minutes / 60
        
        if hours > 0 {
            return "\(hours) hour\(hours == 1 ? "" : "s") ago"
        } else if minutes > 0 {
            return "\(minutes) minute\(minutes == 1 ? "" : "s") ago"
        } else {
            return "Just now"
        }
    }
}

struct ReportStrayDogView: View {
    @Binding var isPresented: Bool
    @State private var message = ""
    @State private var selectedLocation = "Current Location"
    @State private var showingConfirmation = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Location")) {
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                        Text(selectedLocation)
                    }
                    
                    Button(action: {
                        // Pick location on map
                    }) {
                        Text("Change Location")
                            .foregroundColor(.blue)
                    }
                }
                
                Section(header: Text("Details")) {
                    TextEditor(text: $message)
                        .frame(height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    
                    Text("Describe the dog's condition and location details")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Section(header: Text("Photo (Optional)")) {
                    Button(action: {
                        // Pick photo
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .foregroundColor(.blue)
                            Text("Add Photo")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        showingConfirmation = true
                    }) {
                        Text("Submit Report")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .listRowBackground(Color.clear)
                    .disabled(message.isEmpty)
                }
            }
            .navigationTitle("Report Stray Dog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
            .alert("Report Submitted", isPresented: $showingConfirmation) {
                Button("OK") {
                    isPresented = false
                }
            } message: {
                Text("Thank you! Your report has been submitted and local animal services have been notified.")
            }
        }
    }
}

#Preview {
    EmergencyMapView()
}
