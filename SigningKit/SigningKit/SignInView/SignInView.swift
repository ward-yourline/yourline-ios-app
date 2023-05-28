//
//  SignInView.swift
//  SigningKit
//
//  Created by Warrd Adlani on 28/05/2023.
//

import SwiftUI

struct SignInView: View {
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("YourLine")
            
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                
                Text("Business and pleasure")
            }
            
            VStack(alignment: .leading) {
                Text("Sign in")
                    .padding(.top, 10)
                TextField("Enter email", text: $emailText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                TextField("Enter password", text: $passwordText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Forgot password")
                        .padding()
                }
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.black)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
            
            VStack {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Sign in with Google")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Forgot password")
                        .padding()
                }
            }
            // Bottom of view
            Spacer()
        }
        .padding(.horizontal, 20.0)
        .padding(.vertical, 20.0)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
