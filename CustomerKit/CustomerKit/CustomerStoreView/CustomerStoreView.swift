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
    public var body: some View {
        NavigationView {
            ZStack {
                Color.red
                Text("Store")
            }
            .navigationTitle("Store")
        }
    }
}

struct CustomerStoreView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerStoreView()
    }
}
