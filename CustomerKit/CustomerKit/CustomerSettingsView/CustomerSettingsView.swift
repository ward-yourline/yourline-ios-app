//
//  CustomerSettingsView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Webservice
import Utilities
import Presentation
import Data // TODO: Put in VM

public protocol CustomerSettingsViewDelegate {
    func didSignOut()
}

public struct CustomerSettingsView: View {

    @State var name = ""
    let userStorage = UserStorage()
    private var delegate: CustomerSettingsViewDelegate?
    
    init(delegate: CustomerSettingsViewDelegate?) {
        self.delegate = delegate
    }
    
    public var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Form {
                    Section {
                        TextField("Name", text: $name)
                        LabeledContent("iOS Version", value: "16.2")
                    } header: {
                        Text("About")
                    }
                    Section {
                        Button("Reset All Content and Settings") {
                            
                            // Reset logic
                        }
                        WideButton(buttonTitle: "Sign out") {
                            userStorage.clearUserData()
                            delegate?.didSignOut()
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
        } else {
            // Fallback on earlier versions
        }
      }
}
struct CustomerSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerSettingsView(delegate: nil)
    }
}
