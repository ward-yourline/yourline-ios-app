//
//  CustomerStoreView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Webservice
import Utilities
import Presentation

public struct CustomerStoreView: View {
    @State private var searchText = ""

    public var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    SearchBar(text: $searchText)
                    Spacer()
                    CustomerCategoriesView()
                        .padding(10)
                }
            }
            .navigationTitle("Store")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            
            Button(action: {
                // Perform search action
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(.systemGray))
            }
            .padding(.trailing, 16)
        }
        .padding(.top, 16)
    }
}

struct CustomerStoreView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerStoreView()
    }
}


struct CustomerCategoriesView: View {
    
    var body: some View {
        HStack() {
            Text("Categories")
                .font(.headline)
            Spacer()
        }
        .padding(.top, 10)
        
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text("Tech")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                Text("Food")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
            .frame(height: 100)

            HStack(spacing: 10) {
                Text("Leisure")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                Text("Domestic")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
            .frame(height: 100)
            
            HStack(spacing: 10) {
                Text("Entertainment")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                Text("Fitness")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
            .frame(height: 100)
        }
    }
}
