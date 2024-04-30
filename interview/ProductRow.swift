//
//  ProductRow.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/30/24.
//

import SwiftUI

struct ProductsRow: View {
    var product: Product
    @State private var showGreeting = false
    @Environment(\.modelContext) var context
    @State private var isOn = false
    var body: some View {
        NavigationLink(destination: details(product: product)) {
            HStack {
                Image("product")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30)

                Text(product.productName).padding(.leading)
                Spacer()
                Toggle(isOn: $isOn) {
                    Text("Print")
                }
                .toggleStyle(.button)
                .onChange(of: isOn) {
                    product.isPrinted.toggle()
                }
            }
        }
    }
}

//#Preview {
//    ProductRow()
//}
