import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let location: String
    let description: String
    let imageName: String
    let category: EventCategory
    let attendees: Int
}

enum EventCategory: String, CaseIterable {
    case adoption = "Adoption"
    case training = "Training"
    case social = "Social"
    case charity = "Charity"
    case health = "Health"
    
    var color: Color {
        switch self {
        case .adoption: return .purple
        case .training: return .blue
        case .social: return .orange
        case .charity: return .pink
        case .health: return .green
        }
    }
    
    var icon: String {
        switch self {
        case .adoption: return "heart.fill"
        case .training: return "book.fill"
        case .social: return "person.3.fill"
        case .charity: return "gift.fill"
        case .health: return "cross.fill"
        }
    }
}

struct EventsView: View {
    @State private var selectedCategory: EventCategory? = nil
    
    let events = [
        Event(
            title: "Dog Adoption Fair",
            date: Date().addingTimeInterval(86400 * 2),
            location: "Central Park",
            description: "Meet rescue dogs looking for their forever homes. All breeds, all ages!",
            imageName: "pawprint.circle.fill",
            category: .adoption,
            attendees: 45
        ),
        Event(
            title: "Puppy Training Class",
            date: Date().addingTimeInterval(86400 * 5),
            location: "Bark & Learn Center",
            description: "Basic obedience training for puppies 8-16 weeks old. Sign up now!",
            imageName: "book.circle.fill",
            category: .training,
            attendees: 12
        ),
        Event(
            title: "Dog Beach Meetup",
            date: Date().addingTimeInterval(86400 * 1),
            location: "Sandy Bay Beach",
            description: "Let your dogs play and socialize while you meet other dog owners!",
            imageName: "figure.walk",
            category: .social,
            attendees: 67
        ),
        Event(
            title: "Charity Walk for Rescues",
            date: Date().addingTimeInterval(86400 * 7),
            location: "Downtown Loop",
            description: "5K walk to raise funds for local animal rescue organizations.",
            imageName: "heart.circle.fill",
            category: .charity,
            attendees: 89
        ),
        Event(
            title: "Free Vaccination Clinic",
            date: Date().addingTimeInterval(86400 * 3),
            location: "Community Vet Center",
            description: "Free vaccinations and health checkups for dogs. First come first serve.",
            imageName: "cross.circle.fill",
            category: .health,
            attendees: 34
        ),
        Event(
            title: "Agility Training Workshop",
            date: Date().addingTimeInterval(86400 * 10),
            location: "Canine Sports Arena",
            description: "Learn agility training basics. All skill levels welcome!",
            imageName: "sportscourt.fill",
            category: .training,
            attendees: 28
        )
    ]
    
    var filteredEvents: [Event] {
        if let category = selectedCategory {
            return events.filter { $0.category == category }
        }
        return events
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Category Filter
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            // All Events Button
                            Button(action: {
                                selectedCategory = nil
                            }) {
                                Text("All Events")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedCategory == nil ? .white : .primary)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == nil ? Color.blue : Color.gray.opacity(0.2))
                                    .cornerRadius(20)
                            }
                            
                            ForEach(EventCategory.allCases, id: \.self) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    HStack(spacing: 6) {
                                        Image(systemName: category.icon)
                                            .font(.system(size: 12))
                                        Text(category.rawValue)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(selectedCategory == category ? .white : .primary)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? category.color : Color.gray.opacity(0.2))
                                    .cornerRadius(20)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 8)
                    
                    // Events List
                    ForEach(filteredEvents.sorted(by: { $0.date < $1.date })) { event in
                        EventCard(event: event)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Events & Announcements")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct EventCard: View {
    let event: Event
    @State private var isRegistered = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header with category badge
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: event.category.icon)
                        .font(.system(size: 12))
                    Text(event.category.rawValue)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(event.category.color)
                .cornerRadius(15)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 12))
                    Text("\(event.attendees)")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.secondary)
            }
            
            // Title
            Text(event.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            // Date and Location
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                        .font(.system(size: 14))
                    Text(formatDate(event.date))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack(spacing: 8) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                    Text(event.location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            // Description
            Text(event.description)
                .font(.body)
                .foregroundColor(.primary)
                .lineLimit(3)
            
            // Register Button
            Button(action: {
                isRegistered.toggle()
            }) {
                HStack {
                    Image(systemName: isRegistered ? "checkmark.circle.fill" : "person.badge.plus")
                    Text(isRegistered ? "Registered" : "Register for Event")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isRegistered ? Color.green : Color.blue)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    EventsView()
}
