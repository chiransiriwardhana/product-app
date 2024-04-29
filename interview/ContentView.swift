//
//  ContentView.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var context
    var body: some View {
        ProductList()
    }

    func fetch() -> [Product]{
        let fetchDescriptor = FetchDescriptor<Product>()
        var items: [Product] = []

        do {

            let products = try context.fetch(fetchDescriptor)

            for product in products {
                items.append(product)
            }

        } catch {}
        return items
    }
}

#Preview {
    ContentView()
}
