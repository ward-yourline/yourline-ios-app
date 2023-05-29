//
//  SignUpView.swift
//  SigningKit
//
//  Created by Warrd Adlani on 28/05/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("YourLine")
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                
                Text("Business and pleasure")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Sign in")
                TextField("Enter email", text: $emailText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Enter password", text: $passwordText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Forgot password")
                        .padding(.vertical, 10)
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            VStack(spacing: 10) {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 0)
            
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
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
            Spacer()
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                Text("New to YourLine? Sign up here")
                    .padding()
            }
        }
        .padding(.horizontal, 20.0)
        .padding(.vertical, 20.0)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
