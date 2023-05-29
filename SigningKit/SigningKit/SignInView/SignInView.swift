//
//  SignInView.swift
//  SigningKit
//
//  Created by Warrd Adlani on 28/05/2023.
//

import SwiftUI
import Resources

struct SignInView: View {
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                HStack {
                    Text("Your")
                        .font(.custom(Fonts.bold.name, size: 48))
                        .foregroundColor(CustomColors.blue.color)
                    Text("Line")
                        .font(.custom(Fonts.bold.name, size: 48))
                        .foregroundColor(CustomColors.darkGrey.color)
                }
                
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                    .padding(.horizontal, 10)
                
                Text("Business and pleasure").font(.custom(Fonts.regular.name, size: 20))
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Sign in").font(.custom(Fonts.bold.name, size: 18))

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
                        .background(CustomColors.darkGrey.color)
                        .cornerRadius(8)
                        .font(.custom(Fonts.bold.name, size: 16))

                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 0)
            
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                .padding(.horizontal, 10)
            
            VStack {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Sign in with Google")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .padding()
                        .font(.custom(Fonts.bold.name, size: 16))
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
                    .font(.custom(Fonts.regular.name, size: 16))
            }
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
