//
//  ProductList.swift
//  interview
//
//  Created by Chiran Siriwardena on 4/28/24.
//

import SwiftUI
import SwiftData

struct ProductList: View {
    @Query(sort: \Product.orderIndex) var items: [Product]
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationView {
            VStack(spacing:0) {
                List {
                    Section {
                        ForEach(items) { pro in
                            ProductsRow(product: pro)
                        }
                        .onMove(perform: moveItem)
                        .onDelete(perform: removeItem)
                    }
                }
                Button("Print", action: {
                    for i in 0...(items.count-1){
                        if items[i].isPrinted {
                            context.delete(items[i])
                        }
                    }
                })
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(.pink)
                .cornerRadius(10)
                .padding(.bottom, 100)
            }
            .navigationTitle("Available Products")
            .navigationBarItems(leading: EditButton(), trailing:
                                    NavigationLink(destination: EditView()) {
                Text("Add")
            })
        }
    }



    private func moveItem(from source: IndexSet, to destination:  Int) {
        var updatedItems = items
        updatedItems.move(fromOffsets: source, toOffset: destination)
        for (index, item) in updatedItems.enumerated() {
            item.orderIndex = index
        }
    }

    func removeItem(at indexSet: IndexSet) {
        for i in indexSet {
            let product = items[i]
            context.delete(product)
        }
    }
}

//#Preview {
//    ProductList()
//}
