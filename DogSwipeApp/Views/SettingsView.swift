import SwiftUI

struct SettingsView: View {
    @State private var isSignedIn = false
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var showingSignIn = false
    
    var body: some View {
        NavigationView {
            Form {
                if isSignedIn {
                    // User Profile Section
                    Section(header: Text("Profile")) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(username.isEmpty ? "Dog Lover" : username)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(email.isEmpty ? "user@example.com" : email)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.leading, 8)
                        }
                        .padding(.vertical, 8)
                        
                        Button(action: {
                            isSignedIn = false
                            username = ""
                            email = ""
                            password = ""
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                Text("Sign Out")
                            }
                            .foregroundColor(.red)
                        }
                    }
                    
                    // App Settings
                    Section(header: Text("App Settings")) {
                        Toggle(isOn: $notificationsEnabled) {
                            HStack {
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.orange)
                                Text("Notifications")
                            }
                        }
                        
                        Toggle(isOn: $darkModeEnabled) {
                            HStack {
                                Image(systemName: "moon.fill")
                                    .foregroundColor(.purple)
                                Text("Dark Mode")
                            }
                        }
                    }
                    
                    // Account Settings
                    Section(header: Text("Account")) {
                        NavigationLink(destination: Text("Edit Profile")) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.blue)
                                Text("Edit Profile")
                            }
                        }
                        
                        NavigationLink(destination: Text("Privacy Settings")) {
                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.green)
                                Text("Privacy")
                            }
                        }
                        
                        NavigationLink(destination: Text("Payment Methods")) {
                            HStack {
                                Image(systemName: "creditcard.fill")
                                    .foregroundColor(.orange)
                                Text("Payment Methods")
                            }
                        }
                    }
                    
                } else {
                    // Sign In Section
                    Section(header: Text("Welcome")) {
                        VStack(spacing: 20) {
                            Image(systemName: "pawprint.circle.fill")
                                .font(.system(size: 80))
                                .foregroundColor(.blue)
                            
                            Text("Sign in to access your account")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                            
                            Button(action: {
                                showingSignIn = true
                            }) {
                                Text("Sign In")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                showingSignIn = true
                            }) {
                                Text("Create Account")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.vertical)
                    }
                    .listRowBackground(Color.clear)
                }
                
                // About Section
                Section(header: Text("About")) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    
                    NavigationLink(destination: Text("Help & Support")) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.blue)
                            Text("Help & Support")
                        }
                    }
                    
                    NavigationLink(destination: Text("Terms of Service")) {
                        HStack {
                            Image(systemName: "doc.text")
                                .foregroundColor(.blue)
                            Text("Terms of Service")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showingSignIn) {
                SignInView(isPresented: $showingSignIn, isSignedIn: $isSignedIn, username: $username, email: $email)
            }
        }
    }
}

struct SignInView: View {
    @Binding var isPresented: Bool
    @Binding var isSignedIn: Bool
    @Binding var username: String
    @Binding var email: String
    
    @State private var inputEmail = ""
    @State private var inputPassword = ""
    @State private var inputUsername = ""
    @State private var isCreatingAccount = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(isCreatingAccount ? "Create Account" : "Sign In")) {
                    if isCreatingAccount {
                        TextField("Username", text: $inputUsername)
                            .textContentType(.username)
                            .autocapitalization(.none)
                    }
                    
                    TextField("Email", text: $inputEmail)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $inputPassword)
                        .textContentType(.password)
                }
                
                Section {
                    Button(action: {
                        // Simulate sign in
                        username = isCreatingAccount ? inputUsername : "Dog Lover"
                        email = inputEmail
                        isSignedIn = true
                        isPresented = false
                    }) {
                        Text(isCreatingAccount ? "Create Account" : "Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .listRowBackground(Color.clear)
                    .disabled(inputEmail.isEmpty || inputPassword.isEmpty)
                }
                
                Section {
                    Button(action: {
                        isCreatingAccount.toggle()
                    }) {
                        Text(isCreatingAccount ? "Already have an account? Sign In" : "Don't have an account? Create one")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle(isCreatingAccount ? "Create Account" : "Sign In")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
