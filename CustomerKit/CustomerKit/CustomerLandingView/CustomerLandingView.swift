//
//  CustomerLandingView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 31/05/2023.
//

import SwiftUI

public struct CustomerLandingView: View {
    public var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    List {
                        HStack(spacing: 10) {
                            Button("Hello") {
                                // TODO
                            }
                            Text("First product")
                        }
                        Text("First product")
                        Text("First product")
                    }
                }
            }
            .navigationTitle("YourLine")
        }
    }
}

struct CustomerLandingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerLandingView()
    }
}
