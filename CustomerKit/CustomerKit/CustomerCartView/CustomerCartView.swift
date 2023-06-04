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
import Resources

public struct CustomerCartView: View {
      
    @State private var itemCount = 0

    public var body: some View {
        NavigationView {
            VStack {
                List {
                    ItemCartCell()
                    ItemCartCell()
                    ItemCartCell()
                }
                .padding(0)
                .listStyle(.plain)
                
                VStack {
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("£100.00")
                    }
                    WideButton(buttonTitle: "Continue with purchase") {
                        // TODO
                    }
                }
                .padding(10)
            }
            .navigationTitle("Cart")
        }
    }
}

public struct ItemCartCell: View {
    public var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Image("product_placeholder")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .background(Color.red)
                        .cornerRadius(10)
                    .clipped()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5.0) {
                        Text("Some item Some item")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Text("£100.0")
                            .font(Fonts.bold.swiftUIFont())
                            .lineLimit(1)
                    }
                    
                    HStack {
                        HStack {
                            Text("Quantity:")
                            Divider()
                            Text("2")
                            
                            Button {
                                // TODO
                            } label: {
                                Image(systemName: "chevron.down")
                            }
                        }
                        .foregroundColor(Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/))
                        .padding(5)
                        .background(Color.black.opacity(0.03))
                        .frame(height: 30)
                        .clipped()
                        .cornerRadius(5)
                        
                        Spacer()
                        
                        Button {
                            // TODO
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .foregroundColor(Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/))
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(width: 30, height: 30, alignment: .center)
                    }
                }
                .padding(.leading)
                Spacer()
            }
            Divider()
        }.listRowSeparator(.hidden)
    }
}

struct CustomerCartView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCartView()
    }
}
