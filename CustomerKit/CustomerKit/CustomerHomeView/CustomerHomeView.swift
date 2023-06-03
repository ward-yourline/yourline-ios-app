//
//  CustomerHomeView.swift
//  CustomerKit
//
//  Created by Warrd Adlani on 01/06/2023.
//

import SwiftUI
import Webservice
import Utilities
import Presentation
import Domain

struct CustomerHomeView: View {
    @StateObject private var viewModel: CustomerHomeViewModel
    
    init(webService: WebServiceProtocol) {
        let viewModel = CustomerHomeViewModel(webService: webService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        VStack {
                            ZStack {
                                Image("product_placeholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                    .overlay(.foreground)
                                    .opacity(0.1)
                                Text("Promotional")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Recommended for you")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                        
                        ItemsCollectionView(items: viewModel.items, delegate: viewModel)
                            .padding(.horizontal, 10)
                            .refreshable {
                                viewModel.getItems()
                            }
                    }
                }
                // NavigationLink
                if let selectedItem = viewModel.selectedItem {
                    NavigationLink(
                        destination: ItemDetailView(item: selectedItem),
                        isActive: $viewModel.isShowingDetailView,
                        label: { EmptyView() }
                    )
                    .hidden()
                }
            }
            .navigationTitle("Home")
        }
        .onAppear {
            viewModel.getItems()
        }
    }
}

struct CustomerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerHomeView(webService: WebService())
    }
}
