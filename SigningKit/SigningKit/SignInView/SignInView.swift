//
//  SignInView.swift
//  SigningKit
//
//  Created by Warrd Adlani on 28/05/2023.
//

import SwiftUI
import Resources
import Webservice
import Presentation
import Data // TODO: Put in VM

struct SignInView: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var errorMessage = ""
    @State private var isSignInError = false
    @State private var isBusy = false
    
    private var router: SignInViewRouter?
    private let webService: WebServiceProtocol
    private let userStorage = UserStorage() // TODO: Put in VM
    
    init(router: SignInViewRouter? = nil, webService: WebServiceProtocol) {
        self.router = router
        self.webService = webService
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Image("yl_splash_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 256, height: 196, alignment: .center)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Sign in").font(.custom(Fonts.bold.name, size: 18))
                    
                    TextField("Enter email", text: $emailText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    SecureField("Enter password", text: $passwordText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        Text("Forgot password")
                            .padding(.vertical, 10)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                
                WideButton(buttonTitle: "Sign in") {
                    let input = UserSignInInput(email: emailText, password: passwordText)
                    let query = SignInQuery(input: input)
                    isBusy = true
                    webService.apollo.fetch(query: query) { result in // Change the query name to your query name
                        switch result {
                        case .success(let graphQLResult):
                            if let errors = graphQLResult.errors {
                                isSignInError = true
                                errorMessage = errors.first?.message ?? ""
                            } else {
                                print("Success! Result: \(graphQLResult)")
                                
                                guard
                                    let token = graphQLResult.data?.signIn.accessToken,
                                    let refreshToken = graphQLResult.data?.signIn.refreshToken,
                                    let userID = graphQLResult.data?.signIn.id
                                else {
                                    errorMessage = "Missing data, failed to sign in."
                                    return
                                }
                                
                                userStorage.setValue(token, for: .accessToken)
                                userStorage.setValue(refreshToken, for: .accessToken)
                                userStorage.setValue(userID, for: .userID)
                                
                                router?.didSignIn()
                            }
                        case .failure(let error):
                            print("Failure! Error: \(error)")
                            isSignInError = true
                            errorMessage = error.localizedDescription
                        }
                        isBusy = false
                    }
                }.alert(isPresented: $isSignInError) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("Okay")))
                }
                
                Divider()
                
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
                                    .stroke(Color.platinum, lineWidth: 1)
                            )
                    }
                }
                Spacer()
                Button(action: {
                    router?.openSignUpView()
                }) {
                    Text("New to YourLine? Sign up here")
                        .padding()
                        .font(.custom(Fonts.regular.name, size: 16))
                }
            }
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            
            // Activity when busy
            if isBusy {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(router: nil, webService: WebService())
    }
}
