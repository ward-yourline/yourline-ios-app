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
import Data

struct CustomerHomeView: View {
    @StateObject private var viewModel: CustomerHomeViewModel
    @State var currentPageIndex : Int = 0

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
                                
                                VStack {
                                    Spacer()
                                    PageControl(currentPageIndex: currentPageIndex, numberOfPages: 3, indicatorColor: UIColor.gray, currentPageIndicatorTintColor: UIColor.black)
                                }
                            }
                        }
                        
                        HStack() {
                            Text("Recommended for you")
                                .font(.headline)
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        
                        ItemsCollectionView(items: viewModel.items, delegate: viewModel)
                            .refreshable {
                                viewModel.getItems()
                            }
                    }
                }
                // NavigationLink
                if let selectedItem = viewModel.selectedItem {
                    let webService = WebService()
                    let storage = UserStorage()
                    let viewModel = CustomerItemDetailViewModel(
                        item: selectedItem,
                        webService: webService,
                        userStorage: storage
                    )
                    NavigationLink(
                        destination: CustomerItemDetailView(viewModel: viewModel),
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
