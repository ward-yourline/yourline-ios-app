//
//  CustomerCartView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 02/06/2023.
//


import SwiftUI
import Webservice
import Utilities
import Presentation

public struct CustomerCartView: View {
      
    @State var name = ""
    public var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Text("Cart")
//                Form {
//                    Section {
//                        TextField("Name", text: $name)
//                        LabeledContent("iOS Version", value: "16.2")
//                    } header: {
//                        Text("About")
//                    }
//                    Section {
//                        Button("Reset All Content and Settings") {
//
//                            // Reset logic
//                        }
//                    }
//                }
                .navigationBarTitle("Cart")
            }
        } else {
            // Fallback on earlier versions
        }
      }
}
struct CustomerCartView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerSettingsView()
    }
}
