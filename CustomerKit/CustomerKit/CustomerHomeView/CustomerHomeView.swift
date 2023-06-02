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

typealias Item = Webservice.FetAllItemsQuery.Data.FetchAllItem

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
                    ItemsCollectionView(items: viewModel.items, delegate: viewModel)
                        .padding(.horizontal, 10)
                        .refreshable {
                            viewModel.getItems()
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
