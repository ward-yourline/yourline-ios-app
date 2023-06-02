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
