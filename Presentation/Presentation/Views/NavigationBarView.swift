//
//  NavigationBarView.swift
//  Presentation
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Resources

public struct NavigationBarView: View {
    
    var title: String = ""
    
    public init(title: String = "") {
        self.title = title
    }
    
    public var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            Text(title)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
        .frame(height: 70.0)
        .frame(width: .infinity, alignment: .top)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Navigation Bar Title")
    }
}
