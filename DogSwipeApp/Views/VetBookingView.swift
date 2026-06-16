import SwiftUI

struct Vet: Identifiable {
    let id = UUID()
    let name: String
    let specialty: String
    let rating: Double
    let reviewCount: Int
    let location: String
    let imageName: String
    let availableDays: String
}

struct VetBookingView: View {
    let vets = [
        Vet(name: "Dr. Sarah Johnson", specialty: "General Practice", rating: 4.8, reviewCount: 124, location: "Downtown Vet Clinic", imageName: "person.circle.fill", availableDays: "Mon - Fri"),
        Vet(name: "Dr. Michael Chen", specialty: "Surgery Specialist", rating: 4.9, reviewCount: 98, location: "Pet Care Center", imageName: "person.circle.fill", availableDays: "Tue - Sat"),
        Vet(name: "Dr. Emily Rodriguez", specialty: "Emergency Care", rating: 4.7, reviewCount: 156, location: "24/7 Animal Hospital", imageName: "person.circle.fill", availableDays: "All Week"),
        Vet(name: "Dr. James Williams", specialty: "Dental & Nutrition", rating: 4.6, reviewCount: 87, location: "Happy Paws Clinic", imageName: "person.circle.fill", availableDays: "Mon - Thu")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vets) { vet in
                        VetCard(vet: vet)
                    }
                }
                .padding()
            }
            .navigationTitle("Book a Vet")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct VetCard: View {
    let vet: Vet
    @State private var showingBooking = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 15) {
                // Vet Image
                Image(systemName: vet.imageName)
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                    .frame(width: 70, height: 70)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    // Name
                    Text(vet.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    // Specialty
                    Text(vet.specialty)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // Rating
                    HStack(spacing: 4) {
                        ForEach(0..<5) { index in
                            Image(systemName: index < Int(vet.rating) ? "star.fill" : "star")
                                .font(.system(size: 12))
                                .foregroundColor(.yellow)
                        }
                        Text("\(String(format: "%.1f", vet.rating))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("(\(vet.reviewCount) reviews)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            
            Divider()
            
            // Location
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.red)
                Text(vet.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // Available Days
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                Text("Available: \(vet.availableDays)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // Book Button
            Button(action: {
                showingBooking = true
            }) {
                Text("Book Appointment")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 8)
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .sheet(isPresented: $showingBooking) {
            BookingDetailView(vet: vet, isPresented: $showingBooking)
        }
    }
}

struct BookingDetailView: View {
    let vet: Vet
    @Binding var isPresented: Bool
    @State private var selectedDate = Date()
    @State private var selectedTime = "10:00 AM"
    @State private var showingConfirmation = false
    
    let timeSlots = ["9:00 AM", "10:00 AM", "11:00 AM", "2:00 PM", "3:00 PM", "4:00 PM"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Veterinarian")) {
                    HStack {
                        Image(systemName: vet.imageName)
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading) {
                            Text(vet.name)
                                .font(.headline)
                            Text(vet.specialty)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section(header: Text("Select Date")) {
                    DatePicker("Appointment Date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                }
                
                Section(header: Text("Select Time")) {
                    Picker("Time", selection: $selectedTime) {
                        ForEach(timeSlots, id: \.self) { time in
                            Text(time).tag(time)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section {
                    Button(action: {
                        showingConfirmation = true
                    }) {
                        Text("Confirm Booking")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Book Appointment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
            .alert("Booking Confirmed!", isPresented: $showingConfirmation) {
                Button("OK") {
                    isPresented = false
                }
            } message: {
                Text("Your appointment with \(vet.name) is confirmed for \(selectedDate.formatted(date: .abbreviated, time: .omitted)) at \(selectedTime)")
            }
        }
    }
}

#Preview {
    VetBookingView()
}
