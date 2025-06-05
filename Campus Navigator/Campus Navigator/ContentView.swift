import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Back arrow
            Button(action: {
                // Handle back action
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding(.leading, 24)
            .padding(.top, 24)
            
            // Title
            VStack(alignment: .leading, spacing: 0) {
                (
                    Text("Login to")
                        .foregroundColor(.black)
                    + Text(" Your")
                        .foregroundColor(.blue)
                    + Text(" Account")
                        .foregroundColor(.black)
                )
                .font(.system(size: 48, weight: .bold))
            }
            .padding(.leading, 35)
            .padding(.top, 16)
            
            Spacer()
            
            // Input fields
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity)
            
            // Remember me (centered)
            HStack {
                Spacer()
                Button(action: { rememberMe.toggle() }) {
                    Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                        .foregroundColor(rememberMe ? .blue : .gray)
                }
                Text("Remember me")
                    .font(.body)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            // Sign in button
            Button(action: {
                // Handle sign in
            }) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(24)
                    .font(.headline)
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            // Forgot password
            HStack {
                Spacer()
                Button(action: {
                    // Handle forgot password
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
                Spacer()
            }
            .padding(.top, 8)
            
            // Or continue with
            HStack(alignment: .center) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
                Text("or continue")
                    .foregroundColor(.black)
                    .font(.footnote)
                    .padding(.horizontal, 8)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            
            // Social icons (centered)
            HStack(spacing: 24) {
                Spacer()
                ForEach(["facebook", "google", "apple"], id: \.self) { icon in
                    Button(action: {
                        // Handle social login
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(.systemGray6))
                                .frame(width: 44, height: 44)
                            Image(icon + ".logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 32)
            
            // Don't have an account
            HStack {
                Spacer()
                Button(action: {
                    // Handle sign up
                }) {
                    Text("Don't have an account?")
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
                Spacer()
            }
            .padding(.top, 16)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
